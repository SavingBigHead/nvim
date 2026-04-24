vim.pack.add({
	{ src = "https://github.com/okuuva/auto-save.nvim" },
})

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
	group = vim.api.nvim_create_augroup("auto_save", { clear = true }),
	once = true,
	callback = function()
		require("auto-save").setup()
	end,
})
