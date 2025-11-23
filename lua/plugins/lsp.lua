vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/williamboman/mason.nvim",
    "https://github.com/williamboman/mason-lspconfig.nvim",
    "https://github.com/gbprod/none-ls-shellcheck.nvim",
    "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
})

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

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("my.lsp", {}),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client:supports_method("textDocument/completion") then
            -- Optional: trigger autocompletion on EVERY keypress. May be slow!
            local chars = {}
            for i = 32, 126 do
                table.insert(chars, string.char(i))
            end
            client.server_capabilities.completionProvider.triggerCharacters = chars
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        end
    end,
})

vim.lsp.enable({
    "lua_ls", "bashls", "tombi", "yamlls", "texlab", "json-lsp"
})

if vim.lsp.inlay_hint then
    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("LspInlayHints", { clear = true }),
        callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if client and client.server_capabilities.inlayHintProvider then
                vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
            end
        end,
    })
end

local format_grp = vim.api.nvim_create_augroup("AutoFormatOnSave", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    group = format_grp,
    callback = function(args)
        -- Skip if no attached LSP client supports formatting
        local clients = vim.lsp.get_active_clients { bufnr = args.buf }
        for _, client in ipairs(clients) do
            if client.supports_method "textDocument/formatting" then
                vim.lsp.buf.format { bufnr = args.buf, async = false }
                break
            end
        end
    end,
})
