local status_ok, zen_mode = pcall(require, "zen-mode")
if not status_ok then
  return
end

local lsp_inlayhints = require "lsp-inlayhints"
zen_mode.setup {
  window = {
    backdrop = 1,
    height = 1.0,
    width = 1.0,
    options = {
      signcolumn = "no",
      number = true,
      relativenumber = true,
      cursorline = true,
      cursorcolumn = false, -- disable cursor column
      -- foldcolumn = "0", -- disable fold column
      -- list = false, -- disable whitespace characters
    },
  },
  plugins = {
    gitsigns = { enabled = false },
    tmux = { enabled = false },
    twilight = { enabled = false },
    -- this will change the font size on wezterm when in zen mode
    -- See alse also the Plugins/Wezterm section in this projects README
    wezterm = {
      enabled = true,
      -- can be either an absolute font size or the number of incremental steps
      font = "+2", -- (10% increase per step)
    },
  },
  on_open = function()
    lsp_inlayhints.toggle()
    lvim.builtin.cmp.active = true
    lvim.builtin.breadcrumbs.active = false
    -- vim.cmd [[LspStop]]
    -- local status_ok, _ = pcall(vim.api.nvim_set_option_value, "winbar", nil, { scope = "local" })
    -- if not status_ok then
    --   return
    -- end
  end,
  on_close = function()
    lsp_inlayhints.toggle()
    lvim.builtin.breadcrumbs.active = true
    lvim.builtin.cmp.active = true
    -- vim.cmd [[LspStart]]
    -- require("user.winbar").create_winbar()
  end,
}
