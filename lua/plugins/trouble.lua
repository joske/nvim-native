vim.pack.add(
    {
        { src = "https://github.com/folke/trouble.nvim" },
    },
    { confirm = false }
)

require("trouble").setup()
