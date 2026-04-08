vim.pack.add(
    {
        { src = "https://github.com/folke/todo-comments.nvim" },
    },
    { confirm = false }
)

require("todo-comments").setup()
