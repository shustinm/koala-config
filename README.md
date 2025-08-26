# Neovim configuration
This folder shares configuration for KoalaVim and vscode-neovim, based on [KoalaVim](https://github.com/KoalaVim/KoalaVim) configuration template

# vscode-neovim

## Fixes

### ctrl+u/d goes to the top/bottom of the screen

Using [multi-command](https://marketplace.cursorapi.com/items?itemName=ryuta46.multi-command) to create commands to scroll and center screen on cursor and remap keybinds:

settings.json:
```json
"multiCommand.commands": [
    {
      "command": "multiCommand.pageUp",
      "sequence": [
        {"command": "editorScroll", "args": {"to": "up", "by": "wrappedLine", "value": 32 }},
        { "command": "cursorMove", "args": { "to": "viewPortCenter" } }
      ]
    },
    {
      "command": "multiCommand.pageDown",
      "sequence": [
        {"command": "editorScroll", "args": {"to": "down", "by": "wrappedLine", "value": 32 }},
        { "command": "cursorMove", "args": { "to": "viewPortCenter" } }
      ]
    }
]
 ```

keybindings.json:
 ```json
// Unbind ctrl+u/d to replace with multicommand that also 
{
    "key": "ctrl+u",
    "command": "-vscode-neovim.ctrl-u",
    "when": "editorTextFocus && neovim.ctrlKeysNormal.u && neovim.init && neovim.mode != 'insert' && editorLangId not in 'neovim.editorLangIdExclusions'"
},
{
    "key": "ctrl+d",
    "command": "-vscode-neovim.ctrl-d",
    "when": "editorTextFocus && neovim.ctrlKeysNormal.d && neovim.init && neovim.mode != 'insert' && editorLangId not in 'neovim.editorLangIdExclusions'"
},
// Bind ctrl+u/d to multiCommands that also focus the 
{
    "key": "ctrl+u",
    "command": "multiCommand.pageUp",
    "when": "editorTextFocus"
},
{
    "key": "ctrl+d",
    "command": "multiCommand.pageDown",
    "when": "editorTextFocus"
}
```