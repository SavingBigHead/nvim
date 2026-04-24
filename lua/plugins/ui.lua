vim.pack.add({
	{ src = "https://github.com/folke/noice.nvim" },
	{ src = "https://github.com/rebelot/heirline.nvim" },
	{ src = "https://github.com/akinsho/bufferline.nvim" },
	{ src = "https://github.com/nvimdev/dashboard-nvim" },
	{
		src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
		version = vim.version.range("3"),
	},
	{ src = "https://github.com/folke/trouble.nvim" },
	{ src = "https://github.com/folke/which-key.nvim" },
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/rcarriga/nvim-notify",
})

require("heirline").setup(require("configs.heirline"))

require("noice").setup({
	lsp = {
		hover = {
			enabled = false,
		},
		signature = {
			enabled = false,
		},
	},
})

require("bufferline").setup({
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
})

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

require("neo-tree").setup({
	window = {
		width = 30,
	},
	filesystem = {
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = false,
		},
	},
})

vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "BufNewFile" }, {
	group = vim.api.nvim_create_augroup("trouble", { clear = true }),
	once = true,
	callback = function()
		require("trouble").setup()
	end,
})

require("which-key").setup()
