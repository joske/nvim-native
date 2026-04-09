vim.pack.add(
    {
        {
            src = "https://github.com/saghen/blink.cmp",
            version = vim.version.range('1')
        },
        { src = "https://github.com/rafamadriz/friendly-snippets" },
    },
    { confirm = false }
)

require("blink.cmp").setup({
    keymap = { preset = "enter" },
    signature = { enabled = true },
    completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
        menu = {
            auto_show = true,
            draw = {
                treesitter = { "lsp" },
                columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind" } },
            },
        },
    },
    snippets = { preset = "luasnip" },
    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
})
