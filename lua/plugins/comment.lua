vim.pack.add(
    { { src = "https://github.com/numToStr/Comment.nvim" } },
    { confirm = false }
)

require("Comment").setup {
    mappings = {
        basic = false,
        extra = false,
    },
}
