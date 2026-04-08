vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        if ev.data.spec.name == "blink.cmp" and (ev.data.kind == "install" or ev.data.kind == "update") then
            vim.system({ "cargo", "build", "--release" }, { cwd = ev.data.spec.path }):wait()
        end
    end,
})

vim.pack.add(
    {
        { src = "https://github.com/saghen/blink.cmp" },
        { src = "https://github.com/rafamadriz/friendly-snippets" },
    },
    { confirm = false }
)

-- Build fuzzy matching library if missing
local blink_path = vim.fn.stdpath("data") .. "/site/pack/core/opt/blink.cmp"
if vim.fn.isdirectory(blink_path) == 1 then
    local so_ext = vim.uv.os_uname().sysname == "Darwin" and "dylib" or "so"
    local lib_path = blink_path .. "/target/release/libblink_cmp_fuzzy." .. so_ext
    if vim.fn.filereadable(lib_path) == 0 then
        vim.notify("blink.cmp: building fuzzy library...", vim.log.levels.INFO)
        local result = vim.system({ "cargo", "build", "--release" }, { cwd = blink_path }):wait()
        if result.code ~= 0 then
            vim.notify("blink.cmp: build failed!\n" .. (result.stderr or ""), vim.log.levels.ERROR)
        end
    end
end

require("blink.cmp").setup({
    keymap = { preset = "enter" },
    signature = { enabled = true },
    completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
        menu = {
            auto_show = true,
            draw = {
                treesitter = { "lsp" },
                columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind" } },
            },
        },
    },
    snippets = { preset = "luasnip" },
    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
})
