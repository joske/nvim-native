vim.pack.add(
    {
        { src = "https://github.com/nvim-mini/mini.move", },
        { src = "https://github.com/nvim-mini/mini.pairs", },
        { src = "https://github.com/nvim-mini/mini.icons", },
        { src = "https://github.com/nvim-mini/mini.comment" },
    },
    { confirm = false }
)
require("mini.move").setup()
require("mini.pairs").setup()
require("mini.icons").setup()
require("mini.comment").setup({
    mappings = {
        comment = "<leader>/",
        comment_line = "<leader>/",
        comment_visual = "<leader>/",
        textobject = "<leader>/",
    },
})
