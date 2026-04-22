local M = {
	-- {
	-- 	"navarasu/onedark.nvim",
	-- 	lazy = false,
	--   priority = 1000,
	-- 	config = function()
	-- 		require("onedark").setup({
	-- 			style = "dark",
	-- 			highlights = {
	-- 				DiagnosticVirtualTextError = { bg = "NONE" },
	-- 				DiagnosticVirtualTextWarn = { bg = "NONE" },
	-- 				DiagnosticVirtualTextInfo = { bg = "NONE" },
	-- 				DiagnosticVirtualTextHint = { bg = "NONE" },

	-- 				LspInlayHint = { bg = "NONE" },
	-- 			},
	-- 		})
	-- 		require("onedark").load()
	-- 	end,
	-- },

	{
		"olimorris/onedarkpro.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local cp = require("onedarkpro.helpers").get_colors()
			require("onedarkpro").setup({
				highlights = {
					DiagnosticVirtualTextError = { bg = "NONE" },
					DiagnosticVirtualTextWarn = { bg = "NONE" },
					DiagnosticVirtualTextInfo = { bg = "NONE" },
					DiagnosticVirtualTextHint = { bg = "NONE" },

					LspInlayHint = { bg = "NONE" },

					NeoTreeDirectoryIcon = { fg = cp.bule },
					NeoTreeRootName = { fg = cp.yellow },
					dashboardHeader = { fg = cp.yellow },
				},
			})
			vim.cmd("colorscheme onedark")
		end,
	},

	-- {
	-- 	"catppuccin/nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	name = "catppuccin",
	-- 	config = function()
	-- 		require("catppuccin").setup({
	-- 			auto_integrations = true,
	-- 			custom_highlights = function()
	-- 				return {
	-- 					DiagnosticVirtualTextError = { bg = "NONE" },
	-- 					DiagnosticVirtualTextWarn = { bg = "NONE" },
	-- 					DiagnosticVirtualTextInfo = { bg = "NONE" },
	-- 					DiagnosticVirtualTextHint = { bg = "NONE" },

	-- 					LspInlayHint = { bg = "NONE" },
	-- 				}
	-- 			end,
	-- 		})
	-- 		vim.cmd.colorscheme("catppuccin")
	-- 	end,
	-- },

	{
		"rebelot/heirline.nvim",
		event = "VeryLazy",
		config = function()
			vim.opt.laststatus = 3
			require("heirline").setup(require("configs.heirline"))
		end,
	},

	{
		-- noice通知和悬浮命令行
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				hover = {
					enabled = false,
				},
				signature = {
					enabled = false,
				},
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},

	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			options = {
				separator_style = "slant",
				diagnostics = "nvim_lsp",
				show_buffer_close_icons = false,
				always_show_bufferline = false,
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
					},
				},
			},
		},
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		main = "ibl",
		opts = {
			indent = { char = "│" },
			scope = { char = "│" },
		},
	},
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				config = {
					header = {
						"                                                                     ",
						"       ████ ██████           █████      ██                     ",
						"      ███████████             █████                             ",
						"      █████████ ███████████████████ ███   ███████████   ",
						"     █████████  ███    █████████████ █████ ██████████████   ",
						"    █████████ ██████████ █████████ █████ █████ ████ █████   ",
						"  ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
						" ██████  █████████████████████ ████ █████ █████ ████ ██████ ",
						"                                                                       ",
					},
					shortcut = {},
					footer = {},
				},
			})
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
}

return M
