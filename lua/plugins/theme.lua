local M = {
	-- {
	-- 	"navarasu/onedark.nvim",
	-- 	lazy = false,
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
		"catppuccin/nvim",
		lazy = false,
		priority = 1000,
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
		"rebelot/heirline.nvim",
		event = "VeryLazy",
		config = function()
			vim.opt.laststatus = 3
			require("heirline").setup(require("configs.heirline"))
		end,
	},

	-- {
	-- 	"nvim-lualine/lualine.nvim",
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		local auto_theme_custom = require("lualine.themes.catppuccin")

	-- 		for _, mode in pairs(auto_theme_custom) do
	-- 			for section_name, section_config in pairs(mode) do
	-- 				if section_name ~= "a" then
	-- 					section_config.bg = "NONE"
	-- 				end
	-- 			end
	-- 		end

	-- 		local function get_lsp()
	-- 			local msg = "No Active LSP"
	-- 			local clients = vim.lsp.get_clients({ bufnr = 0 })
	-- 			if next(clients) == nil then
	-- 				return msg
	-- 			end
	-- 			local client_names = {}
	-- 			for _, client in ipairs(clients) do
	-- 				if client.name ~= "null-ls" and client.name ~= "copilot" then
	-- 					table.insert(client_names, client.name)
	-- 				end
	-- 			end
	-- 			if #client_names == 0 then
	-- 				return msg
	-- 			else
	-- 				return " " .. table.concat(client_names, ", ")
	-- 			end
	-- 		end

	-- 		local function get_cwd()
	-- 			local name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
	-- 			return " " .. name
	-- 		end

	-- 		require("lualine").setup({
	-- 			options = {
	-- 				theme = auto_theme_custom,
	-- 				component_separators = "",
	-- 				section_separators = "",
	-- 				globalstatus = true,
	-- 			},
	-- 			sections = {
	-- 				lualine_a = {
	-- 					{ "mode", icon = "" },
	-- 				},
	-- 				lualine_b = {
	-- 					{ "filename", file_status = true, path = 0 },
	-- 					{ "branch", icon = "" },
	-- 					{ "diagnostics", symbols = { error = " ", warn = " ", info = " " } },
	-- 				},
	-- 				lualine_c = { "=" },
	-- 				lualine_x = {
	-- 					{ "diff", symbols = { added = " ", modified = " ", removed = " " } },
	-- 					{ "location" },
	-- 					{ "encoding" },
	-- 					{ "filetype", icon_only = false },
	-- 					{ get_lsp },
	-- 					{ get_cwd },
	-- 				},
	-- 				lualine_y = {},
	-- 				lualine_z = {},
	-- 			},
	-- 		})
	-- 	end,
	-- },

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
