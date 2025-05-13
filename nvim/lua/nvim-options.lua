vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")

vim.o.signcolumn = "yes:1"
vim.opt.number = true
vim.api.nvim_set_option("clipboard", "unnamedplus")
vim.opt.termguicolors = true

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
