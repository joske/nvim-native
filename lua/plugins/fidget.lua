vim.pack.add(
    { { src = "https://github.com/j-hui/fidget.nvim", version = "main" } },
    { confirm = false }
)
require('fidget').setup {}
