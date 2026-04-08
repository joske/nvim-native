vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        if ev.data.spec.name == "blink.cmp" and (ev.data.kind == "install" or ev.data.kind == "update") then
            vim.system({ "cargo", "build", "--release" }, { cwd = ev.data.spec.path }):wait()
        end
    end,
})

vim.pack.add(
    {
        { src = "https://github.com/saghen/blink.cmp" },
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
