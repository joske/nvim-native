vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("my.lsp", {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method("textDocument/completion") then
			-- Optional: trigger autocompletion on EVERY keypress. May be slow!
			local chars = {}
			for i = 32, 126 do
				table.insert(chars, string.char(i))
			end
			client.server_capabilities.completionProvider.triggerCharacters = chars
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
	end,
})

vim.lsp.enable({
	"lua_ls",
})

if vim.lsp.inlay_hint then
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("LspInlayHints", { clear = true }),
		callback = function(args)
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			if client and client.server_capabilities.inlayHintProvider then
				vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
			end
		end,
	})
end

--
-- local format_grp = vim.api.nvim_create_augroup("AutoFormatOnSave", { clear = true })
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     group = format_grp,
--     callback = function(args)
--         -- Skip if no attached LSP client supports formatting
--         local clients = vim.lsp.get_active_clients { bufnr = args.buf }
--         for _, client in ipairs(clients) do
--             if client.supports_method "textDocument/formatting" then
--                 vim.lsp.buf.format { bufnr = args.buf, async = false }
--                 break
--             end
--         end
--     end,
-- })
