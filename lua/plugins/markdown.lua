vim.pack.add(
    {
        { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
        { src = "https://github.com/iamcco/markdown-preview.nvim" },
    },
    { confirm = false }
)

require("render-markdown").setup({})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    once = true,
    callback = function()
        vim.cmd("packadd markdown-preview.nvim")
        -- markdown-preview needs yarn build
        local mp_app = vim.fn.stdpath("data") .. "/site/pack/core/opt/markdown-preview.nvim/app"
        if vim.fn.isdirectory(mp_app) == 1 and vim.fn.isdirectory(mp_app .. "/node_modules") == 0 then
            vim.fn.system({ "yarn", "install", "--cwd", mp_app })
        end
    end,
})
