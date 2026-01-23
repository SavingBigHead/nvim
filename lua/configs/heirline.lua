local conditions = require("heirline.conditions")
local utils = require("heirline.utils")
local cp = require("catppuccin.palettes").get_palette()

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
		hl = function()
			return { fg = cp.base, bg = cp.mauve, bold = true }
		end,
	},
}

-- =====================
-- Filename + Git + Diagnostics
-- =====================

local FileName = {
	hl = { fg = cp.text },
	condition = conditions.buffer_not_empty,
	provider = function()
		return vim.fn.expand("%:t") .. " "
	end,
}

local Git = {
	hl = { fg = cp.text },
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
		hl = { fg = cp.sky },
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
	hl = { fg = cp.text },
	provider = function()
		local line = vim.fn.line(".")
		local col = vim.fn.col(".")
		return string.format("%d:%d ", line, col)
	end,
}

local Encoding = {
	hl = { fg = cp.text },
	provider = function()
		return (vim.bo.fenc ~= "" and vim.bo.fenc or vim.o.enc) .. " "
	end,
}

local FileType = {
	hl = { fg = cp.text },
	provider = function()
		return vim.bo.filetype .. " "
	end,
}

local LSP = {
	provider = function()
		local text = get_lsp()
		return text .. " "
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
	hl = { fg = cp.text },
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
