require("lvim.lsp.manager").setup "marksman"

-- allow word wrap
vim.opt.wrap = true
-- allow cursor move between wrapped lines
vim.keymap.set("n", "<down>", "gj")
vim.keymap.set("n", "<up>", "gk")
vim.keymap.set("v", "<down>", "gj")
vim.keymap.set("v", "<up>", "gk")

require("glow").setup({
  glow_path = "",                -- will be filled automatically with your glow bin in $PATH, if any
  install_path = "~/.local/bin", -- default path for installing glow binary
  border = "shadow",             -- floating window border config
  style = "dark",                -- filled automatically with your current editor background, you can override using glow json style
  pager = false,
  width = 80,
  height = 100,
  width_ratio = 0.7, -- maximum width of the Glow window compared to the nvim window size (overrides `width`)
  height_ratio = 0.7,
})
