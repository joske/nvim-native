vim.pack.add {
    { src = 'https://github.com/stevearc/aerial.nvim' },
}
require('aerial').setup {
    backends = { "lsp", "treesitter", "markdown" },
    layout = {
        max_width = { 40, 0.2 },
        min_width = 20,
        default_direction = "right",
    },
    show_guides = true,
    attach_mode = "window",
    close_automatic_events = { "unsupported", "unfocus" },
    open_automatic = true,
}
