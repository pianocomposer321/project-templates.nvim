# project-templates.nvim
A neovim project management plugin.

# Installation
Add this to your init.vim:

- vim-plug:
  - `Plug pianocomposer321/project-templates.nvim'`
  
- Vundle:
  - `Plugin pianocomposer321/project-templates.nvim'`

etc.

Then run `"PlugInstall` (vim-plug) or `PluginInstall` (Vundle)

Finally, run `:UpdateRempotePlugins` and restart Neovim.

# Usage

- `:LoadTemplate` - Load a template into a new project
- `:DeleteTemplate` - Delete a template
- `:SaveAsTemplate` - Save the current folder and all files and subfolders as a new template

# Credits

Finder.vim - https://vim.fandom.com/wiki/Implement_your_own_interactive_finder_without_plugins

Inspiration - [This](https://github.com/bit101/ProjectMaker) Sublime text plugin and [this](https://github.com/cantonios/vscode-project-templates) VS Code Extension
