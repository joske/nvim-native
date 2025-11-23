vim.pack.add({
    {
        src = "https://github.com/akinsho/toggleterm.nvim",
    }
})

local opts = {
    direction = "float",
}

require('toggleterm').setup(opts)
