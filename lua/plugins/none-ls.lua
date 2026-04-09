vim.pack.add(
    {
        { src = "https://github.com/nvim-lua/plenary.nvim" },
        { src = "https://github.com/nvimtools/none-ls.nvim" },
    },
    { confirm = false }
)

local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.yamlfmt,
        require("none-ls-shellcheck.diagnostics"),
        require("none-ls-shellcheck.code_actions"),
    },
})
