vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
})

vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "BufNewFile" }, {
	group = vim.api.nvim_create_augroup("highlights", { clear = true }),
	once = true,
	callback = function()
		require("nvim-treesitter").setup({
			highlight = {
				enable = true,
				use_languagetree = true,
			},
			indent = { enable = true },
		})

		require("gitsigns").setup()

		require("treesitter-context").setup({
			separator = ".",
		})
	end,
})

vim.api.nvim_create_user_command("InstallAllTS", function()
	local languages = {
		"html",
		"lua",
		"luadoc",
		"printf",
		"vim",
		"vimdoc",
		"rust",
		"cpp",
		"python",
	}

	local ts_cmd = "TSInstall " .. table.concat(languages, " ")
	vim.cmd(ts_cmd)
end, {})
