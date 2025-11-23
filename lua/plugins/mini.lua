vim.pack.add {
    { src = "https://github.com/nvim-mini/mini.move", },
    { src = "https://github.com/nvim-mini/mini.pairs", },
    { src = "https://github.com/nvim-mini/mini.icons", },
}

require("mini.move").setup()
require("mini.pairs").setup()
require("mini.icons").setup()
