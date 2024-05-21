local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"
  api.config.mappings.default_on_attach(bufnr)
end

lvim.builtin.nvimtree.setup.on_attach = my_on_attach
lvim.builtin.nvimtree.setup.view.centralize_selection = false
lvim.builtin.nvimtree.setup.view.number = true
lvim.builtin.nvimtree.setup.view.relativenumber = true
-- lvim.builtin.nvimtree.setup.renderer.icons.glyphs.folder.open = "📂"
-- lvim.builtin.nvimtree.setup.renderer.icons.glyphs.folder.open = ""
-- lvim.builtin.nvimtree.setup.renderer.icons.glyphs.folder.default = ""
-- lvim.builtin.nvimtree.setup.renderer.icons.glyphs.folder.empty = ""
-- lvim.builtin.nvimtree.setup.renderer.icons.glyphs.folder.symlink = ""

-- vim.api.nvim_create_autocmd({ 'WinEnter', 'BufWinEnter' }, {
--   pattern = 'NvimTree*',
--   callback = function()
--     local def = vim.api.nvim_get_hl_by_name('Cursor', true)
--     vim.api.nvim_set_hl(0, 'Cursor', vim.tbl_extend('force', def, { blend = 100 }))
--     vim.opt.guicursor:append('a:Cursor/lCursor')
--   end,
-- })

-- vim.api.nvim_create_autocmd({ 'BufLeave', 'WinClosed' }, {
--   pattern = 'NvimTree*',
--   callback = function()
--     local def = vim.api.nvim_get_hl_by_name('Cursor', true)
--     vim.api.nvim_set_hl(0, 'Cursor', vim.tbl_extend('force', def, { blend = 0 }))
--     vim.opt.guicursor = 'n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20'
--   end,
-- })
