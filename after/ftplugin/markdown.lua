vim.treesitter.start()

-- keep gq/gw on the internal paragraph formatter: any attached LSP advertising
-- rangeFormatting makes Neovim set formatexpr, and vim.lsp.formatexpr() then
-- silently no-ops on prose. vim.lsp.buf.format() is unaffected.
vim.bo.formatexpr = ""
vim.api.nvim_create_autocmd("LspAttach", {
    buffer = 0,
    callback = function(args)
        vim.bo[args.buf].formatexpr = ""
    end,
})
