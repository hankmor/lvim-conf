-- ======================================================
-- Plugins Config
-- ======================================================

lvim.plugins = {
    -- { "lunarvim/colorschemes" },
    {
        "nvim-neorg/neorg",
        ft = "norg",   -- lazy-load on filetype
        config = true, -- run require("neorg").setup()
    },
    -- neovim motions on speed!
    {
        "phaazon/hop.nvim",
        event = "BufRead",
        config = function()
            require("hop").setup()
        end,
    },
    -- a tree like view for symbols
    {
        "simrat39/symbols-outline.nvim",
        config = function()
            require('symbols-outline').setup()
        end
    },
    -- diagnostics, references, telescope results, quickfix and location lists
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
        config = function()
        end
    },
    -- automatically saving your work whenever you make changes to it
    {
        "Pocco81/auto-save.nvim",
        config = function()
            require("auto-save").setup()
        end,
    },
    -- interactive scratchpad for hackers, not fo go :D
    {
        "metakirby5/codi.vim",
        cmd = "Codi",
    },
    -- extended incrementing / decrementing
    {
        "monaqa/dial.nvim",
        event = "BufRead",
        version = "v0.2.0",
        config = function()
            local dial = require "dial"
            vim.cmd [[
    nmap <C-a> <Plug>(dial-increment)
    nmap <C-x> <Plug>(dial-decrement)
    vmap <C-a> <Plug>(dial-increment)
    vmap <C-x> <Plug>(dial-decrement)
    vmap g<C-a> <Plug>(dial-increment-additional)
    vmap g<C-x> <Plug>(dial-decrement-additional)
    ]]

            dial.augends["custom#boolean"] = dial.common.enum_cyclic {
                name = "boolean",
                strlist = { "true", "false" },
            }
            table.insert(dial.config.searchlist.normal, "custom#boolean")

            -- For Languages which prefer True/False, e.g. python.
            dial.augends["custom#Boolean"] = dial.common.enum_cyclic {
                name = "Boolean",
                strlist = { "True", "False" },
            }
            table.insert(dial.config.searchlist.normal, "custom#Boolean")
        end,
    },
    -- smooth scrolling
    -- {
    --     "karb94/neoscroll.nvim",
    --     event = "WinScrolled",
    --     config = function()
    --         require('neoscroll').setup({
    --             -- All these keys will be mapped to their corresponding default scrolling animation
    --             mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
    --                 '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
    --             hide_cursor = true,          -- Hide cursor while scrolling
    --             stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    --             use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
    --             respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    --             cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    --             easing_function = nil,       -- Default easing function
    --             pre_hook = nil,              -- Function to run before the scrolling animation starts
    --             post_hook = nil,             -- Function to run after the scrolling animation ends
    --         })
    --     end
    -- },
    -- pick up where you left off
    {
        "ethanholz/nvim-lastplace",
        event = "BufRead",
        config = function()
            require("nvim-lastplace").setup({
                lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
                lastplace_ignore_filetype = {
                    "gitcommit", "gitrebase", "svn", "hgcommit",
                },
                lastplace_open_folds = true,
            })
        end,
    },
    -- highlight and search for todo comments
    {
        "folke/todo-comments.nvim",
        event = "BufRead",
        config = function()
            require("todo-comments").setup()
        end,
    },
    -- mappings to delete, change and add surroundings
    {
        "tpope/vim-surround",

        -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
        -- setup = function()
        --  vim.o.timeoutlen = 500
        -- end
    },
    -- to manage your snippets
    {
        -- snippets管理插件
        "chrisgrieser/nvim-scissors",
        event = "BufRead",
        dependencies = "nvim-telescope/telescope.nvim", -- optional
        config = function()
            local snippetsDir = "~/.config/lvim/snippets/"
            require("luasnip.loaders.from_vscode").lazy_load { paths = { snippetsDir } }
            require("scissors").setup({
                snippetDir = snippetsDir,
            })
        end
    },
    -- dap
    {
        "mfussenegger/nvim-dap",
        keys = {
            { "<leader>dc", "<Cmd>lua require'dap'.continue()<CR>",          desc = "Dap Continue" },
            { "<leader>ds", "<Cmd>lua require'dap'.continue()<CR>",          desc = "Dap Start" },
            { "<leader>dt", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", desc = "Toggle Breakpoint" },
        },
        dependencies = {
            -- dap中启用虚拟文本插件
            "theHamsta/nvim-dap-virtual-text",
            { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
            -- dap 中自动调用 delve 调试 go
            "leoluz/nvim-dap-go",
        },
        config = function()
            require("user.dap").Config()
        end,
    },
    -- go support plugin
    {
        "fatih/vim-go",
        ft = "go",
        config = function()
            require "lsp_signature".on_attach()
        end
    },
    -- hint when you type
    {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function() require "lsp_signature".on_attach() end,
    },
    -- select window
    {
        "yorickpeterse/nvim-window",
        config = function()
            require('nvim-window').setup({
                -- The characters available for hinting windows.
                chars = { '1', '2', '3', '4', '5', '6', '7', '8' },
                -- A group to use for overwriting the Normal highlight group in the floating
                -- window. This can be used to change the background color.
                normal_hl = 'Normal',
                -- The highlight group to apply to the line that contains the hint characters.
                -- This is used to make them stand out more.
                hint_hl = 'Bold',
                -- The border style to use for the floating window.
                border = 'single'
            })
        end
    },
    -- ========== colorthemes ==========
    {
        "sontungexpt/witch",
        priority = 900,
        lazy = false,
        config = function()
            require("witch").setup {
                style = "light",
                theme = {
                    extras = {
                        bracket = true,
                        dashboard = true,
                        diffview = true,
                        explorer = true,
                        -- indentline = true,
                    },
                },
                more_themes = {
                    dark1 = {
                        comment = "#ccc000",
                    }
                }
            }
        end,
    },
    {
        'arzg/vim-colors-xcode',
        config = function()
        end
    },
    {
        'projekt0n/github-nvim-theme',
        lazy = false,        -- make sure we load this during startup if it is your main colorscheme
        priority = 1000,     -- make sure to load this before all the other start plugins
        config = function()
            require('github-theme').setup({
            })
        end,
    },
    -- ========== colorthemes end ==========
}

