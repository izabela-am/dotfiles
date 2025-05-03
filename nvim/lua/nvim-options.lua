vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")

vim.opt.number = true
vim.g.mapleader = " "
vim.api.nvim_set_option("clipboard", "unnamedplus")

vim.keymap.set("n", "<leader>er", function()
	vim.diagnostic.open_float(nil, {
		border = "rounded",
		focusable = false,
		scope = "line",
		header = "",
		source = "always",
		prefix = "",
	})
end, { desc = "Show line diagnostics" })
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
