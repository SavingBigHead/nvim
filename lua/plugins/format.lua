vim.pack.add({
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
})

vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "BufNewFile" }, {
	group = vim.api.nvim_create_augroup("format", { clear = true }),
	once = true,
	callback = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				rust = { "rustfmt" },
				cpp = { "clang-format" },
				tex = { "tex-fmt" },
				python = { "ruff" },
			},
			-- format_on_save = {
			--   timeout_ms = 500,
			--   lsp_fallback = true,
			-- },
		})

		require("ibl").setup({
			indent = { char = "│" },
			scope = { char = "│" },
		})
	end,
})
