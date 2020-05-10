# project-templates.nvim
A neovim project management plugin.

# Quick Start

## Requirements

You will need neovim compiled with python3 support. To determine whether or not your neovim has python support, type `:echo has('python3')` and press enter. If it outputs `1`, you have python3 support, otherwise you will need to rebuild neovim with python support.

Add this to your init.vim:

## Installation

- vim-plug:
  - `Plug 'pianocomposer321/project-templates.nvim', { 'do': 'pip install binaryornot' }`
  
- Vundle:
  - `Plugin 'pianocomposer321/project-templates.nvim', { 'do': 'pip install binaryornot' }`

etc.

Then run `:PlugInstall` (vim-plug) or `:PluginInstall` (Vundle).

Finally, run `:UpdateRempotePlugins` and restart Neovim.

# Usage

- `:LoadTemplate` - Load a template into a new project. The plugin will look for placeholders (e.g. `#{PLACEHOLDER}`), and ask for values to replace them in each non-binary file
- `:DeleteTemplate` - Delete a template
- `:SaveAsTemplate` - Save the current folder and all files and subfolders as a new template

The plugin will look for templates in ~/.templates. Sample templates can be found at https://github.com/pianocomposer321/project-template-samples. If you want to create your own templates, simply create a new project, add the placeholders you want, and save it in ~/.templates.

# Credits

Finder.vim - https://vim.fandom.com/wiki/Implement_your_own_interactive_finder_without_plugins

Inspired by [This](https://github.com/bit101/ProjectMaker) Sublime text plugin and [this](https://github.com/cantonios/vscode-project-templates) VS Code Extension.
