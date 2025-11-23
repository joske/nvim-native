vim.pack.add {
    { src = "https://github.com/numToStr/Comment.nvim" },
}

require("Comment").setup {
    mappings = {
        basic = false,
        extra = false,
    },
}
