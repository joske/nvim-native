# Neovim Config (vim.pack)

Modern Neovim config using the built-in `vim.pack` package manager. Requires Neovim 0.12+.

## Stack

- **vim.pack** for package management (no lazy.nvim)
- **copilot.lua** for GitHub Copilot integration
- **LSP** via nvim-lspconfig (lua_ls, bashls, yamlls, tombi, texlab, json-lsp)
- **Mason** for tool installation
- **Treesitter** for syntax highlighting
- **Snacks** for picker, explorer, dashboard, notifications, lazygit, git, and indent
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
