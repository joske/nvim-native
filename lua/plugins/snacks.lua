vim.pack.add({
	{
		src = "https://github.com/folke/snacks.nvim",
		opts = {
			bigfile = { enabled = true },
			dashboard = { enabled = true },
			explorer = { enabled = false },
			indent = { enabled = true },
			input = { enabled = true },
			notifier = {
				enabled = true,
				timeout = 3000,
			},
			picker = { enabled = true },
			quickfile = { enabled = false },
			scope = { enabled = true },
			scroll = { enabled = false },
			statuscolumn = { enabled = false },
			words = { enabled = true },
			styles = {
				notification = {
					wo = { wrap = true }, -- Wrap notifications
				},
			},
		},
	},
})
