vim.pack.add({
	{ src = "https://github.com/mason-org/mason.nvim" },
})
require("mason").setup()
require("configs.lsp")

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
