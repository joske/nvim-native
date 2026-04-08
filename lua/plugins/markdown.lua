vim.pack.add(
    {
        { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
        { src = "https://github.com/iamcco/markdown-preview.nvim" },
    },
    { confirm = false }
)

require("render-markdown").setup({})

-- markdown-preview needs yarn build
local mp_path = vim.fn.stdpath("data") .. "/site/pack/deps/opt/markdown-preview.nvim/app"
if vim.fn.isdirectory(mp_path) == 1 and vim.fn.isdirectory(mp_path .. "/node_modules") == 0 then
    vim.fn.system({ "yarn", "install", "--cwd", mp_path })
end
