vim.pack.add({
	{ src = "https://github.com/romus204/tree-sitter-manager.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
})

vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "BufNewFile" }, {
	group = vim.api.nvim_create_augroup("tree_sitter", { clear = true }),
	once = true,
	callback = function()
		require("tree-sitter-manager").setup({
			auto_install = true,
		})

		require("gitsigns").setup()

		require("treesitter-context").setup({
			separator = ".",
		})
	end,
})
