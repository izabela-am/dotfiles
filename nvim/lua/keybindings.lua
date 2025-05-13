vim.g.mapleader = " "

vim.keymap.set("n", "<Leader>w", "<Cmd>update<CR>", { desc = "Update Buffer" })
vim.keymap.set("n", "<Leader>qa", "<Cmd>qa<CR>", { desc = "Quit All" })
vim.keymap.set("n", "<Leader>gl", "<C-w>h", { desc = "Go Left" })
vim.keymap.set("n", "<Leader>gr", "<C-w>l", { desc = "Go Right" })

vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous Buffer" })
vim.keymap.set("n", "<Leader>cb", "<Cmd>bd<CR>", { desc = "Close Buffer" })

-- none-ls
vim.keymap.set("n", "<Leader>gf", vim.lsp.buf.format, { desc = "Format Code" })

-- NvimTree
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "Open File Tree" })

-- lsp-config
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Docs" })
vim.keymap.set("n", "<Leader>gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
