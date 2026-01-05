local M = {
	-- {
	-- 	"navarasu/onedark.nvim",
	-- 	lazy = false,
	-- 	config = function()
	-- 		require("onedark").setup({
	-- 			style = "dark",
	-- 			diagnostics = {
	-- 				-- background = false,
	-- 			},
	-- 		})
	-- 		require("onedark").load()
	-- 	end,
	-- },
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				auto_integrations = true,
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
			vim.cmd.colorscheme("catppuccin")
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		config = function()
			require("lualine").setup({
				options = {
					theme = "catppuccin",
					component_separators = "",
					section_separators = { left = "", right = "" },
					globalstatus = true,
				},
				sections = {
					lualine_a = { { "mode", right_padding = 2 } },
					lualine_b = { "filename", "branch" },
					lualine_c = {
						"%=", -- 将后续内容居中或推到右侧
					},
					lualine_x = {},
					lualine_y = { "filetype", "progress" },
					lualine_z = {
						{ "location", left_padding = 2 },
					},
				},
			})
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
