vim.pack.add({
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	"https://github.com/nvim-treesitter/nvim-treesitter",
})

vim.api.nvim_create_user_command("Telescope", function()
	require("telescope").setup({
		mappings = {
			n = { ["q"] = require("telescope.actions").close },
		},
	})
end, {})
