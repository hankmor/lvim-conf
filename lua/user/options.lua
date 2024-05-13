-- ======================================================
-- customize vim options
-- ======================================================

-- load banner, return a table
local function load_banner()
  local banner = {}
  local home = os.getenv "HOME"
  for line in io.lines(home .. "/.config/lvim/lua/user/banner.txt") do
    if string.sub(line, 0, 1) ~= "#" then
      table.insert(banner, line)
    end
  end
  return banner
end
-- set banner
lvim.builtin.alpha.dashboard.section.header.val = load_banner

vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
lvim.builtin.lualine.style = "lvim"
lvim.builtin.alpha.active = true
lvim.reload_config_on_save = false
lvim.builtin.illuminate.active = true -- 自动高亮光标所在的单词, https://github.com/RRethy/vim-illuminate
lvim.builtin.bufferline.active = true
lvim.builtin.gitsigns.active = true
lvim.builtin.terminal.persist_mode = false
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.breadcrumbs.active = true
lvim.builtin.dap.active = true
-- folding codes not working, :e
vim.opt.foldmethod = "expr"                     -- default is "normal"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- default is ""
vim.opt.foldenable = false                       -- if this option is false and fold method option is other than normal, every time a document is opened everything will be folded.
-- lvim.builtin.which_key.setup.plugins.presets.z = true

-- set leader key
lvim.leader = "space"
-- enable transparent window
lvim.transparent_window = false
-- set colorscheme
-- lvim.colorscheme = 'tokyonight'
-- lvim.colorscheme = 'lunar'
-- lvim.colorscheme = 'xcodedark'
lvim.colorscheme = 'github_dark_default'
-- lvim.colorscheme = 'catppuccin'
-- lvim.colorscheme = 'catppuccin-latte'
-- customize color
lvim.autocommands = {
  {
    { "ColorScheme" },
    {
      pattern = "*",
      callback = function()
        -- change `Normal` to the group you want to change
        -- and `#ffffff` to the color you want
        -- see `:h nvim_set_hl` for more options
        -- customize color to mock xcode
        -- vim.api.nvim_set_hl(0, "Comment", { fg = "#56A56D", underline = false, bold = false })
        vim.api.nvim_set_hl(0, "Comment", { fg = "#9fa0a8", underline = false, bold = false })
        -- vim.api.nvim_set_hl(0, "Normal", { bg = "#CCE8CF", underline = false, bold = false })
      end,
    },
  },
}

-- format on save
lvim.format_on_save = false
vim.g.go_fmt_autosave = 0

-- config cmp
lvim.builtin.cmp.sources[1].name = 'codeium'
-- local cmp_sources_table = lvim.builtin.cmp.sources
-- cmp_sources_table[#cmp_sources_table + 1] = {
--     name = "codeium",
--     keyword_length = 4,
-- }

-- vim options
local options = {
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 1,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 1000,                       -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 100,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  laststatus = 3,
  showcmd = false,
  ruler = false,
  relativenumber = true, -- set relative numbered lines
  numberwidth = 4,       -- set number column width to 2 {default 4}
  signcolumn = "yes",    -- always show the sign column, otherwise it would shift the text each time
  wrap = false,          -- display lines as one long line
  scrolloff = 10,        -- fix 10 rows when scroll
  sidescrolloff = 8,
  -- guifont = "monospace:h17", -- the font used in graphical neovim applications
  title = true,
  titleold = vim.split(os.getenv("SHELL") or "", "/")[3],
  -- colorcolumn = "80",
  -- colorcolumn = "120",
}
for k, v in pairs(options) do
  vim.opt[k] = v
end
