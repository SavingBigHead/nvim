vim.pack.add({
	{ src = "https://github.com/luozhiya/fittencode.nvim" },
	{ src = "https://github.com/zbirenbaum/copilot.lua" },
})

vim.api.nvim_create_user_command("FittenCode", function()
	require("fittencode").setup()
end, {})

vim.api.nvim_create_user_command("Copilot", function()
	require("copilot").setup({
		suggestion = {
			enabled = true,
			auto_trigger = true,
			keymap = {
				accept = "<C-y>",
				next = "<C-]>",
				prev = "<C-[>",
				dismiss = "<C-/>",
			},
		},
		panel = { enabled = false },
	})
end, {})
