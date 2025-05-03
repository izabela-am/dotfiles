return {
  {
    "andweeb/presence.nvim",
    event = "VeryLazy",
    config = function()
      require("presence").setup({
        auto_update = true,
        neovim_image_text = "Neovim",
        main_image = "neovim",
        client_id = "793271441293967371", -- Use your own Discord application client id (not recommended)
        log_level = nil,
        debounce_timeout = 10,
        enable_line_number = false,
        blacklist = {},
        buttons = true,
        file_assets = {},
        show_time = false,
        editing_text = "Editing file",
        file_explorer_text = "Browsing file",
        git_commit_text = "Committing changes",
        plugin_manager_text = "Managing plugins",
        reading_text = "Reading file",
        workspace_text = "Working on project",
        line_number_text = "Line %s out of %s",
      })
    end,
  },
}
