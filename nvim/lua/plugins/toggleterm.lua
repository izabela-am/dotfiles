return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      direction = "horizontal",  -- bottom panel
      size = 15,                 -- height of terminal
      shade_terminals = false,
      start_in_insert = true,
      persist_size = true,
      close_on_exit = true,
    })

    -- Toggle with <leader>T
    vim.keymap.set("n", "<leader>tr", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
  end,
}
