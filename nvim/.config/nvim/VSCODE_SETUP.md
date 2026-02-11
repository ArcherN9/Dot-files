# VSCode NeoVim Extension Setup Guide

## Overview

This guide explains how to configure Visual Studio Code to use the shared NeoVim configuration for Vim emulation. By using the NeoVim extension (instead of the standard Vim extension), VSCode will automatically share the same keyboard layout settings and core mappings with IntelliJ IDEA.

## Prerequisites

1. **NeoVim Installation**: You must have NeoVim installed on your system
   - macOS: `brew install neovim`
   - Verify installation: `nvim --version`

2. **Shared Configuration Files**: Ensure the following files exist in `~/.config/nvim/`:
   - `keyboard-layoutt.vim` - Keyboard layout selection (SE/US)
   - `shared-mappings.vim` - Core navigation and editing mappings

## Extension Installation

### Important: Use NeoVim Extension, NOT Vim Extension

VSCode has two different Vim emulation extensions:
- ❌ **Vim** extension (vscodevim.vim) - Does NOT use NeoVim config
- ✅ **NeoVim** extension (asvetliakov.vscode-neovim) - Uses NeoVim config automatically

**Install the correct extension:**

1. Open VSCode
2. Go to Extensions (Cmd+Shift+X on macOS)
3. Search for "neovim"
4. Install **"Neo Vim"** by asvetliakov
   - Extension ID: `asvetliakov.vscode-neovim`
5. **Uninstall** the "Vim" extension if you have it installed

## Configuration

### Automatic Configuration Loading

The NeoVim extension automatically uses your NeoVim configuration from `~/.config/nvim/`. This means:

- ✅ Your keyboard layout selection is automatically applied
- ✅ All shared mappings work immediately
- ✅ No need to duplicate configuration in VSCode settings
- ✅ Changes to `keyboard-layout.vim` affect both IntelliJ and VSCode

### VSCode Settings (Optional)

Add these settings to your VSCode `settings.json` if needed:

```json
{
  // Specify NeoVim executable path (usually auto-detected)
  "vscode-neovim.neovimExecutablePaths.darwin": "/opt/homebrew/bin/nvim",
  
  // Use NeoVim's clipboard integration
  "vscode-neovim.useCtrlKeysForNormalMode": true,
  
  // Disable VSCode's native Ctrl+key bindings that conflict with Vim
  "vscode-neovim.ctrlKeysForInsertMode": []
}
```

To edit `settings.json`:
1. Open Command Palette (Cmd+Shift+P)
2. Type "Preferences: Open User Settings (JSON)"
3. Add the settings above

### Verifying NeoVim Path

If the extension can't find NeoVim, check the path:

```bash
which nvim
```

Then update the `neovimExecutablePaths.darwin` setting with the correct path.

## Keyboard Layout Switching

### How It Works

The keyboard layout is controlled by a single file: `~/.config/nvim/keyboard-layout.vim`

When you change the layout variable in this file, both IntelliJ (IdeaVim) and VSCode (NeoVim extension) will use the new layout.

### Switching Between SE and US Layouts

1. Open `~/.config/nvim/keyboard-layout.vim` in any editor
2. Change the layout variable:
   ```vim
   let g:keyboard_layout = "SE"  " or "US"
   ```
3. Reload VSCode window:
   - Open Command Palette (Cmd+Shift+P)
   - Type "Developer: Reload Window"
   - Press Enter

**Layout Differences:**
- **SE Layout**: Leader key = `å`, End of line = `€`
- **US Layout**: Leader key = `[`, End of line = `$`

## Shared Mappings

The following mappings are automatically available in VSCode through the shared configuration:

### Navigation Remaps
- `K` → Move up
- `J` → Move down  
- `L` → Move right
- `H` → Move left

### Window Navigation
- `<leader>h` → Focus left window
- `<leader>j` → Focus down window
- `<leader>k` → Focus up window
- `<leader>l` → Focus right window

### Tab Navigation
- `<leader>1` through `<leader>9` → Switch to tab 1-9

## Editor-Specific Features

### What Works in VSCode

All standard NeoVim/Vim commands and the shared mappings work in VSCode through the NeoVim extension.

### What Doesn't Work in VSCode

IntelliJ-specific features (defined in `.ideavimrc`) do NOT work in VSCode:
- ❌ Git VCS actions (`:action Vcs.Push`, etc.)
- ❌ Build and debug actions (`:action Build`, etc.)
- ❌ IntelliJ-specific search (`:action GotoAction`, etc.)

These features are IntelliJ-specific and have no equivalent in VSCode through the NeoVim extension. Use VSCode's native commands or keybindings for similar functionality.

## Troubleshooting

### Extension Not Working

1. **Verify NeoVim is installed:**
   ```bash
   nvim --version
   ```

2. **Check extension is active:**
   - Open Command Palette (Cmd+Shift+P)
   - Type "NeoVim: Show Output Channel"
   - Look for any error messages

3. **Verify configuration files exist:**
   ```bash
   ls -la ~/.config/nvim/
   ```
   Should show `keyboard-layout.vim` and `shared-mappings.vim`

### Mappings Not Working

1. **Reload VSCode window:**
   - Command Palette → "Developer: Reload Window"

2. **Check for conflicting keybindings:**
   - Open Keyboard Shortcuts (Cmd+K Cmd+S)
   - Search for conflicting bindings
   - Disable or remap conflicts

3. **Verify NeoVim config loads without errors:**
   ```bash
   nvim --headless -c "source ~/.config/nvim/keyboard-layout.vim" -c "source ~/.config/nvim/shared-mappings.vim" -c "quit"
   ```
   Should exit without errors

### Leader Key Not Working

1. **Verify keyboard layout is set correctly:**
   ```bash
   cat ~/.config/nvim/keyboard-layout.vim | grep keyboard_layout
   ```

2. **Test leader key in standalone NeoVim:**
   ```bash
   nvim
   ```
   Then try a leader-based mapping to confirm it works

3. **Reload VSCode after changing layout:**
   - Always reload the window after editing `keyboard-layout.vim`

## Testing Your Setup

### Quick Verification

1. Open any file in VSCode
2. Press `K` - cursor should move up
3. Press `<leader>h` - should focus left window (if multiple windows open)
4. Verify your leader key works (try `<leader>` followed by any mapped key)

### Full Test

1. **Test navigation remaps:**
   - `K`, `J`, `L`, `H` should move cursor

2. **Test leader key:**
   - SE layout: Press `å` then `h` (should focus left window)
   - US layout: Press `[` then `h` (should focus left window)

3. **Test SE-specific mapping (if using SE layout):**
   - Press `€` - cursor should jump to end of line

## Comparison: IntelliJ vs VSCode

| Feature | IntelliJ (IdeaVim) | VSCode (NeoVim) |
|---------|-------------------|-----------------|
| Keyboard layout selection | ✅ Shared | ✅ Shared |
| Core navigation mappings | ✅ Shared | ✅ Shared |
| Window/tab navigation | ✅ Shared | ✅ Shared |
| Git VCS actions | ✅ IDE-specific | ❌ Not available |
| Build/debug actions | ✅ IDE-specific | ❌ Not available |
| JWT decoder | ✅ IDE-specific | ❌ Not available |
| Configuration location | `~/.ideavimrc` sources shared | `~/.config/nvim/` (automatic) |

## Additional Resources

- [NeoVim Extension Documentation](https://github.com/asvetliakov/vscode-neovim)
- [NeoVim Documentation](https://neovim.io/doc/)
- [Shared Configuration Files](~/.config/nvim/)

## Summary

By using the NeoVim extension in VSCode:
- ✅ Configuration is automatically shared with IntelliJ
- ✅ Keyboard layout switching works across both editors
- ✅ Core mappings are consistent
- ✅ Single source of truth for layout and shared mappings
- ✅ No configuration duplication needed
