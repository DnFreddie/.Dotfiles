return {
  -- {{{ Define the Harpoon lazy.vim specificaiton.

  "ThePrimeagen/harpoon",
  enabled = true,
  event = {"InsertEnter", "CmdLineEnter"},
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },

  -- ----------------------------------------------------------------------- }}}

  keys = function()
    local harpoon = require("harpoon")

    return {
      -- Harpoon marked files 1 through 4
      {"<leader>1", function() harpoon:list():select(1) end, desc ="Harpoon buffer 1"},
      {"<leader>2", function() harpoon:list():select(2) end, desc ="Harpoon buffer 2"},
      {"<leader>3", function() harpoon:list():select(3) end, desc ="Harpoon buffer 3"},

      -- Harpoon user interface.
      {"<C-f>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc ="Harpoon Toggle Menu"},
      {"<leader>m", function() harpoon:list():add() end, desc ="Harpoon add file"},

      -- Use Telescope as Harpoon user interface.
    }
  end,

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Use Harpoon defaults or my customizations.

  opts = function(_, opts)
    opts.settings = {
      save_on_toggle = true,
      sync_on_ui_close = false,
      save_on_change = true,
      enter_on_sendcmd = false,
      tmux_autoclose_windows = false,
      excluded_filetypes = { "harpoon", "alpha", "dashboard", "gitcommit" },
      mark_branch = false,
      key = function()
        return vim.loop.cwd()
      end
    }
  end,

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Configure Harpoon.

  config = function(_, opts)
    require("harpoon").setup(opts)
  end,

  -- ----------------------------------------------------------------------- }}}
}
