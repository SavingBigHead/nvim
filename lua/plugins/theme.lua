vim.pack.add({
	-- { src = "https://github.com/olimorris/onedarkpro.nvim" },
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})

-- local cp = require("onedarkpro.helpers").get_colors()
-- require("onedarkpro").setup({
-- 	highlights = {
-- 		DiagnosticVirtualTextError = { bg = "NONE" },
-- 		DiagnosticVirtualTextWarn = { bg = "NONE" },
-- 		DiagnosticVirtualTextInfo = { bg = "NONE" },
-- 		DiagnosticVirtualTextHint = { bg = "NONE" },
--
-- 		LspInlayHint = { bg = "NONE" },
--
-- 		NeoTreeDirectoryIcon = { fg = cp.blue },
-- 		NeoTreeRootName = { fg = cp.yellow },
-- 		dashboardHeader = { fg = cp.yellow },
-- 	},
-- })
-- vim.cmd("colorscheme onedark")

require("catppuccin").setup({
	flavour = "mocha",

	integrations = {
		gitsigns = true,
		mason = true,
		notify = true,
		lsp_trouble = true,
		which_key = true,
	},

	custom_highlights = function()
		return {
			DiagnosticVirtualTextError = { bg = "NONE" },
			DiagnosticVirtualTextWarn = { bg = "NONE" },
			DiagnosticVirtualTextInfo = { bg = "NONE" },
			DiagnosticVirtualTextHint = { bg = "NONE" },

			LspInlayHint = { bg = "NONE" },
		}
	end,
})
vim.cmd.colorscheme("catppuccin-nvim")
