vim.g.mapleader = " "

vim.keymap.set("n", "<Leader>w", "<Cmd>update<CR>", { desc = "Update Buffer" })
vim.keymap.set("n", "<Leader>qa", "<Cmd>qa<CR>", { desc = "Quit All" })
vim.keymap.set("n", "<Leader>gl", "<C-w>h", { desc = "Go Left" })
vim.keymap.set("n", "<Leader>gr", "<C-w>l", { desc = "Go Right" })

vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous Buffer" })
-- none-ls
vim.keymap.set("n", "<Leader>gf", vim.lsp.buf.format, { desc = "Format Code" })

-- NvimTree
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "Open File Tree" })

-- lsp-config
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Docs" })
vim.keymap.set("n", "<Leader>gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })

vim.keymap.set("n", "<Leader>cb", function()
  local current = vim.api.nvim_get_current_buf()

  local function is_file_buf(buf)
    if not vim.api.nvim_buf_is_valid(buf) then return false end
    if not vim.bo[buf].buflisted then return false end
    if vim.bo[buf].buftype ~= "" then return false end
    return true
  end

  local file_bufs = {}
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if buf ~= current and is_file_buf(buf) then
      table.insert(file_bufs, buf)
    end
  end

  local next_buf = nil
  for _, buf in ipairs(file_bufs) do
    if buf > current then
      next_buf = buf
      break
    end
  end
  if not next_buf and #file_bufs > 0 then
    next_buf = file_bufs[1]
  end

  if next_buf then
    vim.api.nvim_set_current_buf(next_buf)
  end

  if vim.api.nvim_buf_is_valid(current) then
    vim.cmd("bd " .. current)
  end
end, { desc = "Close Buffer" })

