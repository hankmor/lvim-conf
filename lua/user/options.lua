-- ======================================================
-- customize vim options
-- ======================================================

-- set leader key
lvim.leader = "space"
-- set colorscheme
lvim.colorscheme = 'tokyonight'
-- format on save
lvim.format_on_save = false

vim.opt.cmdheight = 2                   -- more space in the neovim command line for displaying messages
-- vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.guifont = "ComicShannsMono:h17" -- the font used in graphical neovim applications
vim.opt.shiftwidth = 4                  -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4                     -- insert 2 spaces for a tab
vim.opt.relativenumber = true           -- relative line numbers
vim.opt.wrap = true                     -- wrap lines
vim.fn.sign_define('DapBreakpoint',{ text ='🔴', texthl ='', linehl ='', numhl =''})
-- vim.fn.sign_define('DapStopped',{ text ='⚪', texthl ='', linehl ='', numhl =''})
-- vim.fn.sign_define('DapBreakpoint',{ text ='❤️', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='👉', texthl ='', linehl ='', numhl =''})

-- use treesitter folding
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- X closes a buffer
lvim.keys.normal_mode["<S-x>"] = ":BufferKill<CR>"
-- delete map
-- lvim.keys.normal_mode["<C-h>"] = false

