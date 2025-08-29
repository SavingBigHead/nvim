local M = {
	{
		"lervag/vimtex",
		lazy = false,
		init = function()
			vim.g.vimtex_view_general_viewer = "SumatraPDF.exe"
      vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
		end,
	},
}

return M
