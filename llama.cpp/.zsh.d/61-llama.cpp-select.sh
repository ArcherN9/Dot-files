#!/bin/bash
# FZF-based model selection with per-model server configuration
# Routes GGUF models to llama.cpp, MLX Community models to mlx_lm.server

MODELS_FILE="$HOME/.pi/agent/models.json"

if [ ! -f "$MODELS_FILE" ]; then
    echo "Error: $MODELS_FILE not found" >&2
    exit 1
fi

# Extract model names and IDs from JSON (from the local-ai provider)
MODELS=$(jq -r '.providers["local-ai"].models[] | "\(.name)\t\(.id)"' "$MODELS_FILE" 2>/dev/null)

if [ -z "$MODELS" ]; then
    echo "Error: No models found in $MODELS_FILE" >&2
    exit 1
fi

# Run fzf with model selection (tab-separated: name\tid)
SELECTED_MODEL=$(echo "$MODELS" | fzf \
    --height 40% \
    --prompt "🤖 AI Model: " \
    --border \
    --border-label "Select a model to deploy" \
    --reverse \
    --tiebreak=index \
    --preview-window=right:60% \
    --exit-0)

if [ -z "$SELECTED_MODEL" ]; then
    exit 1
fi

# Extract name and ID from selected entry
SELECTED_NAME=$(echo "$SELECTED_MODEL" | cut -f1)
SELECTED_ID=$(echo "$SELECTED_MODEL" | cut -f2-)

# Read per-model serverConfig from models.json (match by name — unique)
CFG_JSON=$(jq -r --arg name "$SELECTED_NAME" '.providers["local-ai"].models[] | select(.name == $name) | .serverConfig // {} ' "$MODELS_FILE")

# Helper: extract a config value, return empty string if missing/null
cfg_val() { echo "$CFG_JSON" | jq -r --arg k "$1" '.[$k] // empty'; }
cfg_json() { echo "$CFG_JSON" | jq -c --arg k "$1" '.[$k] // empty'; }

TEMP=$(cfg_val "temperature")
TOP_P=$(cfg_val "top_p")
TOP_K=$(cfg_val "top_k")
MIN_P=$(cfg_val "min_p")
PRESENCE_PENALTY=$(cfg_val "presence_penalty")
REPEAT_PENALTY=$(cfg_val "repeat_penalty")
CTX_SIZE=$(cfg_val "contextWindow")
CACHE_TYPE_K=$(cfg_val "cacheTypeK")
CACHE_TYPE_V=$(cfg_val "cacheTypeV")
CHAT_TEMPLATE_KWARGS=$(cfg_json "chatTemplateKwargs")

# Detect model type based on ID prefix and build launch command
if [[ "$SELECTED_ID" == *"GGUF"* ]]; then
    # ── llama.cpp (GGUF models) ──────────────────────────────────────
    ARGS=()

    # Always-on parameters for llama-server
    ARGS+=("--no-mmproj")
    ARGS+=("-ngl" "99")
    ARGS+=("-np" "1")
    ARGS+=("-fa" "on")
    ARGS+=("--kv-unified")
    ARGS+=("--cache-ram" "4096")
    ARGS+=("--cache-reuse" "256")
    ARGS+=("-b" "2048")
    ARGS+=("-ub" "512")
    ARGS+=("--jinja")

    # Per-model parameters from JSON
    if [ -n "$TEMP" ]; then              ARGS+=("--temp" "$TEMP"); fi
    if [ -n "$TOP_P" ]; then             ARGS+=("--top-p" "$TOP_P"); fi
    if [ -n "$TOP_K" ]; then             ARGS+=("--top-k" "$TOP_K"); fi
    if [ -n "$MIN_P" ]; then             ARGS+=("--min-p" "$MIN_P"); fi
    if [ -n "$PRESENCE_PENALTY" ]; then  ARGS+=("--presence-penalty" "$PRESENCE_PENALTY"); fi
    if [ -n "$REPEAT_PENALTY" ]; then    ARGS+=("--repeat-penalty" "$REPEAT_PENALTY"); fi
    if [ -n "$CTX_SIZE" ]; then          ARGS+=("-c" "$CTX_SIZE"); fi
    if [ -n "$CACHE_TYPE_K" ]; then      ARGS+=("--cache-type-k" "$CACHE_TYPE_K"); else ARGS+=("-ctk" "f16"); fi
    if [ -n "$CACHE_TYPE_V" ]; then      ARGS+=("--cache-type-v" "$CACHE_TYPE_V"); else ARGS+=("-ctv" "f16"); fi
    if [ -n "$CHAT_TEMPLATE_KWARGS" ]; then ARGS+=("--chat-template-kwargs" "$CHAT_TEMPLATE_KWARGS"); fi

    # MTP speculative decoding (only when model ID contains MTP)
    if [[ "$SELECTED_ID" == *"MTP"* ]]; then
        ARGS+=("--spec-type" "draft-mtp")
        ARGS+=("--spec-draft-n-max" "3")
    fi

    echo "🦙 Starting llama-server with GGUF model: $SELECTED_ID"
    echo "   Args: ${ARGS[*]}"
    echo "   Full command: llama-server -hf \"$SELECTED_ID\" ${ARGS[*]}"
    llama-server -hf "$SELECTED_ID" "${ARGS[@]}"

elif [[ "$SELECTED_ID" == *"mlx-community"* ]]; then
    # ── mlx_lm.server (MLX Community models) ─────────────────────────
    ARGS=()

    [ -n "$TEMP" ]              && ARGS+=("--temp" "$TEMP")
    [ -n "$TOP_P" ]             && ARGS+=("--top-p" "$TOP_P")
    [ -n "$TOP_K" ]             && ARGS+=("--top-k" "$TOP_K")
    [ -n "$MIN_P" ]             && ARGS+=("--min-p" "$MIN_P")

    if [ -n "$CHAT_TEMPLATE_KWARGS" ]; then
        ARGS+=("--chat-template-args" "$CHAT_TEMPLATE_KWARGS")
    fi

    echo "🍎 Starting mlx_lm.server with MLX model: $SELECTED_ID"
    echo "   Config: temp=$TEMP top_p=$TOP_P top_k=$TOP_K"
    mlx_lm.server --model "$SELECTED_ID" "${ARGS[@]}"

else
    echo "Error: Unknown model type: $SELECTED_ID" >&2
    exit 1
fi
