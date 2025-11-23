local function require_all(mod_prefix)
    local base = vim.fn.stdpath("config") .. "/lua"
    local dir = base .. "/" .. mod_prefix:gsub("%.", "/")

    for name, type in vim.fs.dir(dir) do
        if type == "file" and name:match("%.lua$") then
            local module = mod_prefix .. "." .. name:gsub("%.lua$", "")
            require(module)
        end
    end
end

require("opts")
require_all("plugins")
require('mappings')

vim.cmd("colorscheme vscode")
