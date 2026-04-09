# Neovim Config (vim.pack)

Modern Neovim config using the built-in `vim.pack` package manager. Requires Neovim 0.12+.

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

#### Clone the repository

```shell
git clone https://github.com/joske/nvim-native ~/.config/nvim
```

## Stack

- **vim.pack** for package management (no lazy.nvim)
- **blink.cmp** for completions
- **copilot.lua** for GitHub Copilot integration
- **LSP** via nvim-lspconfig (lua_ls, bashls, yamlls, tombi, texlab, json-lsp)
- **Mason** for tool installation
- **none-ls** for formatting (shfmt, yamlfmt)
- **Treesitter** for syntax highlighting
- **Snacks** for picker, explorer, dashboard, notifications, lazygit, git, GitHub, terminal, dim, and indent
- **lualine** for statusline
- **bufferline** for buffer tabs
- **which-key** for keybinding hints
- **aerial.nvim** for code outline
- **rustaceanvim** + **crates.nvim** for Rust support
- **neotest** for testing
- **nvim-dap** + **dapui** for debugging
- **Trouble** for diagnostics
- **todo-comments** for TODO highlighting
- **fugitive** for git commands
- **fidget** for LSP progress
- **resession** for session management
- **render-markdown** for in-editor markdown rendering
- **markdown-preview** for browser-based markdown preview
- **rainbow-delimiters** for bracket colorization
- **mini.move**, **mini.pairs**, **mini.comment**, **mini.icons** for editor enhancements
- **toggleterm** for floating terminal
- **LuaSnip** for snippets

## Features

- Format on save
- Inlay hints for supported LSPs
- Neovide support
- No external plugin manager required (uses built-in vim.pack)

## Requirements

- Neovim 0.12+
- Git
- Nerd Font
- ripgrep
- fd
- fzf
- node/yarn
- lazygit
- rust/rust-analyzer
- tree-sitter CLI
- latex
