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

