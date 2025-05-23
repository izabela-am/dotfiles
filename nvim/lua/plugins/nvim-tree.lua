return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      sort = {
        sorter = "case_sensitive",
      },
      git = {
        enable = true,
        ignore = false, -- disables hiding of files/dirs inside .gitignore
      },
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
        custom = {
          "^.git$",
          "^.DS_Store$"
        }
      },
    })
  end,
}
