vim.pack.add({
	{ src = "https://github.com/olimorris/onedarkpro.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
})

local cp = require("onedarkpro.helpers").get_colors()
require("onedarkpro").setup({
	highlights = {
		DiagnosticVirtualTextError = { bg = "NONE" },
		DiagnosticVirtualTextWarn = { bg = "NONE" },
		DiagnosticVirtualTextInfo = { bg = "NONE" },
		DiagnosticVirtualTextHint = { bg = "NONE" },

		LspInlayHint = { bg = "NONE" },

		NeoTreeDirectoryIcon = { fg = cp.blue },
		NeoTreeRootName = { fg = cp.yellow },
		dashboardHeader = { fg = cp.yellow },
	},
})

vim.cmd("colorscheme onedark")
