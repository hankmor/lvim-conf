-- ======================================================
-- customize vim options
-- ======================================================

vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- set leader key
lvim.leader = "space"
-- enable transparent window
lvim.transparent_window = false
-- set colorscheme
-- lvim.colorscheme = 'tokyonight'
-- lvim.colorscheme = 'lunar'
-- lvim.colorscheme = 'xcodedark'
-- lvim.colorscheme = 'github_dark_default'
lvim.colorscheme = 'catppuccin'
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
            end,
        },
    },
}

-- format on save
lvim.format_on_save = false
vim.g.go_fmt_autosave = 0
vim.opt.cmdheight = 2 -- more space in the neovim command line for displaying messages
vim.opt.shiftwidth = 4        -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4           -- insert 2 spaces for a tab
vim.opt.relativenumber = true -- relative line numbers
vim.opt.wrap = true           -- wrap lines
-- dap debug icon
-- vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = '', linehl = '', numhl = '' })
-- vim.fn.sign_define('DapStopped', { text = '👉', texthl = '', linehl = '', numhl = '' })

-- use treesitter folding
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- delete map
-- lvim.keys.normal_mode["<C-h>"] = false
