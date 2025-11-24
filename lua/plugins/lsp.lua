vim.pack.add(
    {
        "https://github.com/neovim/nvim-lspconfig",
        "https://github.com/williamboman/mason.nvim",
        "https://github.com/williamboman/mason-lspconfig.nvim",
        "https://github.com/gbprod/none-ls-shellcheck.nvim",
        "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    { confirm = false }
)

require("mason").setup()
require("mason-lspconfig").setup {}
require('mason-tool-installer').setup {
    -- Make sure to use the names found in `:Mason`
    ensure_installed = {
        -- language servers
        -- don't put rust-analyzer here, use the system rust-analyzer instead
        "lua-language-server",
        "tombi",
        "yamlls",
        "texlab",
        "json-lsp",
        "marksman",
        "bashls",
        "dockerfile-language-server",

        -- formatters
        "shfmt",
        "yamlfmt",
        "latexindent",

        -- linters
        "shellcheck",

        -- debug
        "codelldb",
    },
    integrations = {
        ["mason-lspconfig"] = true,
        ["mason-null-ls"] = true,
        ["mason-nvim-dap"] = true,
    },
}
