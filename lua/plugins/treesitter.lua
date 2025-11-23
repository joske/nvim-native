vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

local ts = require('nvim-treesitter')

-- Wait at most 30 seconds to finish installation.
ts.install(
    { "lua", "rust", "bash", "toml", "json", "yaml", "markdown", },
    { summary = false }
):wait(30000)
