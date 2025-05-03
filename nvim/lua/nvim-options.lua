vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")

vim.opt.number = true
vim.g.mapleader = " "
vim.api.nvim_set_option("clipboard", "unnamedplus")

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
		spacing = 2,
	},
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})
