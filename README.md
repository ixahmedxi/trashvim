<div align="center">
  <img src="https://raw.githubusercontent.com/ixahmedxi/trashvim/main/trash.jpg" alt="Trash logo" width="100px" />
</div>

# Trashvim

> A neovim configuration focusing on TypeScript and web development, utilising LSP and other features to deliver a powerful IDE like editing experience with the performance and productivity of neovim.

<img src="https://raw.githubusercontent.com/ixahmedxi/trashvim/main/screenshot.png" alt="Screenshot tsx file" />

## Features

* Fully setup LSP configuration using Mason, lspconfig and typescript.nvim.
* Linters and formatters support using null-ls.
* Terminal panes support using toggleterm.
* Winbar support outlining the code scope.
* Buffer organisation using bufferline.
* File explorer and git management using neo-tree.
* Highlight of colors including TailwindCSS. 
* Typescript actions such as remove unused, organise imports, adding missing imports...etc

And many more!

## Installation

**Note: Before starting the installation, make sure that if you have a `~/.config/nvim` folder that you move it somewhere else.**

```bash
# Clone the configuration
cd ~/.config
git clone https://github.com/ixahmedxi/trashvim nvim 
cd ~/.config/nvim

# Run PackerSync to get all of the plugins
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
```

To make sure that everything is working fine, try running `nvim init.lua` and seeing if any errors occur, it should start installing treesitter languages and lsp servers on that initial open. If any errors are present, try running `:PackerSync` again.

