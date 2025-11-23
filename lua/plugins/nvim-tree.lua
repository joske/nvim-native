vim.pack.add(
    {
        { src = 'https://github.com/nvim-tree/nvim-tree.lua' },
        { src = 'https://github.com/nvim-lua/plenary.nvim' },
    },
    { confirm = false })

require('nvim-tree').setup({})
