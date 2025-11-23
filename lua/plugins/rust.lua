-- Configure rustaceanvim BEFORE loading the plugin
vim.g.rustaceanvim = {
    tools = {
        codelens = { enable = true },
    },
    server = {
        default_settings = {
            ["rust-analyzer"] = {
                cargo = { allFeatures = true },
                checkOnSave = true,
                lens = { enable = true },
            },
        },
    },
    dap = {
        -- Use a function to defer evaluation until after plugin is loaded
        adapter = function()
            return require("rustaceanvim.config").get_codelldb_adapter(
                vim.fn.stdpath("data") .. "/mason/bin/codelldb",
                vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/lldb/lib/liblldb.so"
            )
        end,
    },
}

-- Now load the plugins
vim.pack.add({
    { src = "https://github.com/mrcjkb/rustaceanvim", version = "main" },
    { src = "https://github.com/saecki/crates.nvim" },
    { src = 'https://github.com/mfussenegger/nvim-dap' },
    { src = 'https://github.com/rcarriga/nvim-dap-ui' },
})

require("crates").setup({})
require('neotest').setup {
    adapters = {
        require "rustaceanvim.neotest" {
            args = { "--no-capture" },
        },
    },
}

local codelens_group = vim.api.nvim_create_augroup("RustCodeLens", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
    group = codelens_group,
    pattern = "*.rs",
    callback = function(args)
        local bufnr = args.buf
        if vim.bo[bufnr].filetype ~= "rust" or not vim.lsp.codelens then return end
        vim.api.nvim_buf_call(bufnr, function() pcall(vim.lsp.codelens.refresh) end)
    end,
})
