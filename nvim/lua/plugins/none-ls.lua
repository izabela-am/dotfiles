return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
        null_ls.builtins.formatting.gofumpt, -- golang
        null_ls.builtins.formatting.goimports_reviser, -- golang
        null_ls.builtins.formatting.golines, -- golang
				null_ls.builtins.formatting.stylua, -- lua
				null_ls.builtins.formatting.prettier, -- js/ts
				null_ls.builtins.formatting.black, -- python
				null_ls.builtins.formatting.isort, -- python
				require("none-ls.diagnostics.eslint_d"), -- js/ts
			},
		})
	end,
}
