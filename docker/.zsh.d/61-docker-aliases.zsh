# Docker aliases

# Dooit - task management TUI
# Runs the dooit container via docker compose and exec's into the interactive session.
# The container runs a persistent bash shell, so you can:
#   - Run `dooit` to launch the TUI
#   - Quit dooit (q) -> back at container shell, run `dooit` again
#   - Run `exit` -> return to host terminal, container keeps running
#   - Run `dooit` again any time to re-enter
alias dooit='docker-compose -f /Users/daksh_s/Docker/dooit/docker-compose.yml run --rm dooit'

# late.sh — SSH into late.sh from a minimal Alpine container with an ed25519 key
alias 'late.ssh'='docker run -it --rm late-ssh'

# Pi coding agent — isolated Docker sandbox (~/Development/ and ~/Docker/ only)
alias pi-sandbox='docker-compose -f /Users/daksh_s/Docker/Pi/docker-compose.yml run --rm pi-sandbox'

# Pi config shell — interactive bash inside the container, starts at ~/.pi/agent
alias pi-sandbox-config='docker-compose -f /Users/daksh_s/Docker/Pi/docker-compose.yml run --rm pi-sandbox-config'
