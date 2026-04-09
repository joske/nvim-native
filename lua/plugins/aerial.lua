vim.pack.add({
        { src = 'https://github.com/stevearc/aerial.nvim' },
        { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    },
    { confirm = false }
)
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
    open_automatic = false,
    ignore = {
        filetypes = { "help", "alpha", "dashboard", "neo-tree", "nvim-tree", "lazy", "mason", "snacks_picker_list" },
        unlisted_buffers = true
    },

}
