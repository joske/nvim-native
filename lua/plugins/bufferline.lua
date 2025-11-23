vim.pack.add {
    { src = "https://github.com/akinsho/bufferline.nvim", }
}
require("bufferline").setup {
    options = {
        diagnostics = "nvim_lsp",
        separator_style = "slant",
        offsets = {
            { filetype = "NvimTree", text = "File Explorer", highlight = "Directory", separator = true },
        },
        always_show_bufferline = true,
    }
}
