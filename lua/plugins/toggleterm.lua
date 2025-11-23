vim.pack.add(
    {
        { src = "https://github.com/akinsho/toggleterm.nvim", },
    },
    { confirm = false }
)

local opts = {
    direction = "float",
}

require('toggleterm').setup(opts)
