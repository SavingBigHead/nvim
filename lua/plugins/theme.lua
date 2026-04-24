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

vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "BufNewFile" }, {
	group = vim.api.nvim_create_augroup("highlights", { clear = true }),
	once = true,
	callback = function()
		require("nvim-treesitter").setup({
			ensure_installed = {
				"html",
				"lua",
				"luadoc",
				"printf",
				"vim",
				"vimdoc",
				"rust",
				"cpp",
				"python",
			},
			auto_install = true,
			highlight = {
				enable = true,
				use_languagetree = true,
			},
			indent = { enable = true },
		})

		require("gitsigns").setup()
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

