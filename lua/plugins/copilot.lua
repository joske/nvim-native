vim.pack.add(
    {
        { src = "https://github.com/zbirenbaum/copilot.lua" },
    },
    { confirm = false }
)

require("copilot").setup({
    suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 150,
        keymap = {
            accept = "<Tab>",
            next = "<C-x>",
            prev = "<C-z>",
            accept_word = "<C-Right>",
            accept_line = "<C-Down>",
            dismiss = "<C-e>",
        },
    },
    panel = { enabled = false },
})
