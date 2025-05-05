return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[                                                                               ]],
      [[                                                                               ]],
      [[                                                                               ]],
      [[                                                                               ]],
      [[            ██╗███████╗ █████╗    ███╗   ██╗██╗   ██╗██╗███╗   ███╗            ]],
      [[            ██║╚══███╔╝██╔══██╗   ████╗  ██║██║   ██║██║████╗ ████║            ]],
      [[            ██║  ███╔╝ ███████║   ██╔██╗ ██║██║   ██║██║██╔████╔██║            ]],
      [[            ██║ ███╔╝  ██╔══██║   ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║            ]],
      [[            ██║███████╗██║  ██║██╗██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║            ]],
      [[            ╚═╝╚══════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝            ]],
      [[                                                                               ]],
      [[                                                                               ]],
      [[                                                                               ]],
    }

    dashboard.section.header.opts = {
      hl = "AlphaHeader",
      position = "center",
    }

    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "  > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
      dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
      dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
      dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
    }

    local function footer()
      local lazy_plugins = require("lazy").stats()
      local lazy_info = string.format("󰏗 Lazy Plugins: %d", lazy_plugins.count)

      local ver = vim.version()
      local nvim_ver = string.format(" Powered by Neovim [v%d.%d.%d]", ver.major, ver.minor, ver.patch)

      local date = os.date(" %d/%m/%Y")

      vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#b083e3", bold = true })
      vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#b083e3", italic = true })

      return {
        nvim_ver,
        lazy_info,
        "",
        date,
        "",
        " Don’t worry if it doesn’t work right.",
        "If everything did, you’d be out of a job ",
      }
    end

    dashboard.section.footer.opts = {
      position = "center",
      hl = "AlphaFooter",
    }
    dashboard.section.footer.val = footer()

    alpha.setup(dashboard.opts)
  end,
}
