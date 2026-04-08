vim.pack.add(
    {
        { src = "https://github.com/stevearc/resession.nvim" },
    },
    { confirm = false }
)

require("resession").setup()

vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        require("resession").save("last")
        require("resession").save(vim.fn.getcwd(), { dir = "dirsession", notify = false })
    end,
})
