-- ======================================================
-- customize vim options
-- ======================================================

-- set leader key
lvim.leader = "space"
-- enable transparent window
lvim.transparent_window = true
-- set colorscheme
-- lvim.colorscheme = 'tokyonight'
-- lvim.colorscheme = 'lunar'
-- lvim.colorscheme = 'xcodedark'
lvim.colorscheme = 'github_dark_default'
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
                vim.api.nvim_set_hl(0, "Comment", { fg = "#56A56D", underline = false, bold = false })
                -- vim.api.nvim_set_hl(0, "Keyword", { fg = "#F87BB0", underline = false, bold = true })
                -- vim.api.nvim_set_hl(0, "Function", { fg = "#75C2B3", underline = false, bold = false })
                -- vim.api.nvim_set_hl(0, "Type", { fg = "#48B0CE", underline = false, bold = true })
                -- vim.api.nvim_set_hl(0, "String", { fg = "#FF806B", underline = false, bold = false })
                -- vim.api.nvim_set_hl(0, "Variable", { fg = "#FFBF67", underline = false, bold = false })
                -- vim.api.nvim_set_hl(0, "property.go", { fg = "#FFA245", underline = false, bold = true })
            end,
        },
    },
}

-- format on save
lvim.format_on_save = false
vim.g.go_fmt_autosave = 0
vim.opt.cmdheight = 2 -- more space in the neovim command line for displaying messages
-- vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
-- vim.opt.guifont = "ComicShannsMono Nerd Font:h20" -- the font used in graphical neovim applications
-- vim.opt.guifont = "JetBrainsMono Nerd Font:h17"
vim.opt.shiftwidth = 4        -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4           -- insert 2 spaces for a tab
vim.opt.relativenumber = true -- relative line numbers
vim.opt.wrap = true           -- wrap lines
-- dap debug icon
vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '👉', texthl = '', linehl = '', numhl = '' })

-- use treesitter folding
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- delete map
-- lvim.keys.normal_mode["<C-h>"] = false
