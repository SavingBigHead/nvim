local M = {
	{
		"luozhiya/fittencode.nvim",
		cmd = "FittenCode",
		-- event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		-- event = "InsertEnter",
		opts = {},
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		opts = {
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
		},
	},
}

return M
