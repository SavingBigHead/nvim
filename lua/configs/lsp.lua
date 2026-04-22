vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")
vim.lsp.enable("rust-analyzer")
vim.lsp.enable("texlab")
vim.lsp.enable("pyright")

local x = vim.diagnostic.severity
vim.diagnostic.config({
	virtual_text = { prefix = "" }, -- 行内显示错误
	signs = { text = { [x.ERROR] = "󰅙", [x.WARN] = "", [x.INFO] = "󰋼", [x.HINT] = "󰌵" } }, -- 行号旁显示标记
	update_in_insert = false,
})

vim.api.nvim_create_user_command("InstallAllLsp", function()
	local tools = {
		"lua-language-server",
		"clangd",
		"rust-analyzer",
		"texlab",
		"pyright",

		"stylua",
		"clang-format",
		"tex-fmt",
		"ruff",
	}

	local mason_cmd = "MasonInstall " .. table.concat(tools, " ")

	vim.cmd(mason_cmd)
end, {})

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
