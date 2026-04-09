vim.pack.add(
    {
        { src = "https://github.com/aznhe21/actions-preview.nvim" },
    },
    { confirm = false }
)

require("actions-preview").setup({
    backend = { "snacks" },
    snacks = {
        layout = { preset = "dropdown" },
    },
})
