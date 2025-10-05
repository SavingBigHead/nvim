local M = {
	{
		"lervag/vimtex",
		lazy = false,
		init = function()
			vim.g.vimtex_view_method = "sioyek"
			if vim.fn.has("wsl") == 1 then
				vim.g.vimtex_view_sioyek_exe = "sioyek.exe"
			end

			vim.g.vimtex_quickfix_ignore_filters = {
				"Underfull",
				"Overfull",
				"specifier changed to",
				"Token not allowed in a PDF string",
				"LaTeX Warning: Float too large for page",
				"contains only floats",
				"LaTeX Warning: Citation",
				'Missing "author" in',
				"LaTeX Font Warning:",
				'Package option "final" no longer has any effect with minted v3+',
			}
		end,
	},
}

return M
