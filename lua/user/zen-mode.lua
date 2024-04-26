local status_ok, zen_mode = pcall(require, "zen-mode")
if not status_ok then
  return
end

zen_mode.setup {
  window = {
    backdrop = 1,
    height = 1.0,
    width = 0.9,
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
  },
  on_open = function()
    require("lsp-inlayhints").toggle()
    lvim.builtin.cmp.active = false
    lvim.builtin.breadcrumbs.active = false
    -- vim.cmd [[LspStop]]
    -- local status_ok, _ = pcall(vim.api.nvim_set_option_value, "winbar", nil, { scope = "local" })
    -- if not status_ok then
    --   return
    -- end
  end,
  on_close = function()
    require("lsp-inlayhints").toggle()
    lvim.builtin.breadcrumbs.active = true
    lvim.builtin.cmp.active = true
    -- vim.cmd [[LspStart]]
    -- require("user.winbar").create_winbar()
  end,
}