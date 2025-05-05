vim.g.mapleader = " "

vim.keymap.set("n", "<Leader>w", "<Cmd>update<CR>")
vim.keymap.set("n", "<Leader>u", "<Cmd>u<CR>")

-- bufferline
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<Leader>cb", "<Cmd>bd<CR>", { desc = "Delete buffer" })

-- none-ls
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

-- NvimTree
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tt', '<C-w>h', { noremap = true, silent = true })

-- lsp-config
vim.keymap.set("n", "K", vim.lsp.buf.hover, {}) -- lang docs
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {}) -- definitions
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {}) -- code actions
