local conditions = require("heirline.conditions")
local utils = require("heirline.utils")
-- local cp = require("catppuccin.palettes").get_palette()
local cp = require("onedarkpro.helpers").get_colors()
-- local cp = require("onedark.colors")

-- Catppuccin	OneDarkPro onedark.nvim	说明
-- cp.base	cp.bg	cp.bg0 背景色
-- cp.text	cp.fg	cp.fg 前景色/文本
-- cp.blue	cp.blue	cp.blue 相同
-- cp.green	cp.green cp.green 相同
-- cp.red	cp.red cp.red 相同
-- cp.yellow	cp.yellow cp.yellow 相同
-- cp.peach	cp.orange	cp.orange 橙色
-- cp.mauve	cp.purple	cp.purple 紫色
-- cp.sky	cp.cyan	cp.cyan 青色

-- =====================
-- Helpers
-- =====================

local function get_lsp()
	local msg = "No Active LSP"
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if next(clients) == nil then
		return msg
	end

	local names = {}
	for _, client in ipairs(clients) do
		if client.name ~= "null-ls" and client.name ~= "copilot" then
			table.insert(names, client.name)
		end
	end

	if #names == 0 then
		return msg
	end
	return " " .. table.concat(names, ", ")
end

local function get_cwd()
	local name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
	return " " .. name
end

-- =====================
-- Mode
-- =====================

local Mode = {
	init = function(self)
		self.mode = vim.fn.mode(1)
	end,
	static = {
		mode_map = {
			n = "NORMAL",
			i = "INSERT",
			v = "VISUAL",
			V = "V-LINE",
			["\22"] = "V-BLOCK",
			c = "COMMAND",
			s = "SELECT",
			S = "S-LINE",
			R = "REPLACE",
			t = "TERMINAL",
		},
	},
	{
		provider = function(self)
			return "  " .. (self.mode_map[self.mode] or self.mode) .. " "
		end,
		hl = function(self)
			local mode_color = {
				n = cp.blue, -- normal
				i = cp.green, -- insert
				t = cp.green, -- terminal
				c = cp.orange, -- command
				v = cp.purple, -- visual
				V = cp.purple,
				["\22"] = cp.purple, -- visual block
				R = cp.red, -- replace
			}

			return {
				fg = cp.bg,
				bg = mode_color[self.mode:sub(1, 1)] or cp.blue,
				bold = true,
			}
		end,
	},
}

-- =====================
-- Filename + Git + Diagnostics
-- =====================

local FileName = {
	hl = { fg = cp.fg},
	condition = conditions.buffer_not_empty,
	provider = function()
		return vim.fn.expand("%:t") .. " "
	end,
}

local Git = {
	hl = { fg = cp.fg},
	condition = conditions.is_git_repo,
	init = function(self)
		self.status = vim.b.gitsigns_status_dict
	end,
	{
		provider = function(self)
			return " " .. self.status.head .. " "
		end,
	},
}

local Diagnostics = {
	condition = conditions.has_diagnostics,
	static = {
		error_icon = " ",
		warn_icon = " ",
		info_icon = " ",
	},
	init = function(self)
		self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
		self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
		self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
	end,
	{
		provider = function(self)
			return self.errors > 0 and (self.error_icon .. self.errors .. " ") or ""
		end,
		hl = { fg = cp.red },
	},
	{
		provider = function(self)
			return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ") or ""
		end,
		hl = { fg = cp.yellow },
	},
	{
		provider = function(self)
			return self.info > 0 and (self.info_icon .. self.info .. " ") or ""
		end,
		hl = { fg = cp.cyan},
	},
}

-- =====================
-- Right side
-- =====================

local GitDiff = {
	condition = conditions.is_git_repo,
	init = function(self)
		self.status = vim.b.gitsigns_status_dict
	end,
	{
		provider = function(self)
			return self.status and self.status.added and self.status.added > 0 and (" " .. self.status.added .. " ")
				or ""
		end,
		hl = { fg = cp.green },
	},
	{
		provider = function(self)
			return self.status
					and self.status.changed
					and self.status.changed > 0
					and (" " .. self.status.changed .. " ")
				or ""
		end,
		hl = { fg = cp.yellow },
	},
	{
		provider = function(self)
			return self.status
					and self.status.removed
					and self.status.removed > 0
					and (" " .. self.status.removed .. " ")
				or ""
		end,
		hl = { fg = cp.red },
	},
}

local Location = {
	hl = { fg = cp.fg},
	provider = function()
		local line = vim.fn.line(".")
		local col = vim.fn.col(".")
		return string.format("%d:%d ", line, col)
	end,
}

local Encoding = {
	hl = { fg = cp.fg},
	provider = function()
		return (vim.bo.fenc ~= "" and vim.bo.fenc or vim.o.enc) .. " "
	end,
}

local FileType = {
	hl = { fg = cp.fg},
	provider = function()
		return vim.bo.filetype .. " "
	end,
}

local LSP = {
	provider = function()
		local fg= get_lsp()
		return fg.. " "
	end,
	hl = function()
		if get_lsp() == "No Active LSP" then
			return { fg = cp.yellow }
		else
			return { fg = cp.green }
		end
	end,
}

local CWD = {
	hl = { fg = cp.fg},
	provider = function()
		return get_cwd() .. " "
	end,
}

-- =====================
-- Align helper
-- =====================

local Align = { provider = "%=" }

-- =====================
-- Statusline
-- =====================

local Space = { provider = " " }

return {
	statusline = {
		Mode,
		Space,
		FileName,
		Space,
		Git,
		Space,
		Diagnostics,
		Space,
		Align,
		Space,
		GitDiff,
		Space,
		Location,
		Space,
		Encoding,
		Space,
		LSP,
		Space,
		CWD,
		Space,
	},
}
