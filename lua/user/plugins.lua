-- ======================================================
-- Plugins Config
-- ======================================================

lvim.plugins = {
  { "lunarvim/colorschemes" },
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
  -- git
  -- git diff in a single tabpage
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  -- show git blame
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
    end,
  },
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit"
    },
    ft = { "fugitive" }
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
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
        hide_cursor = true,           -- Hide cursor while scrolling
        stop_eof = true,              -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false,  -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false,    -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true,  -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = 'circular', -- Default easing function, quadratic, cubic, quartic, quintic, circular, sine
        pre_hook = nil,               -- Function to run before the scrolling animation starts
        post_hook = nil,              -- Function to run after the scrolling animation ends
      })

      local t    = {}
      -- Syntax: t[keys] = {function, {function arguments}}
      -- Use the "sine" easing function
      t['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '50', [['quadratic']] } }
      t['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '50', [['quadratic']] } }
      -- Use the "circular" easing function
      t['<C-b>'] = { 'scroll', { '-vim.api.nvim_win_get_height(0)', 'true', '50', [['quadratic']] } }
      t['<C-f>'] = { 'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '50', [['quadratic']] } }
      -- Pass "nil" to disable the easing animation (constant scrolling speed)
      t['<C-y>'] = { 'scroll', { '-0.10', 'false', '50', nil } }
      t['<C-e>'] = { 'scroll', { '0.10', 'false', '50', nil } }
      -- When no easing function is provided the default easing function (in this case "quadratic") will be used
      t['zt']    = { 'zt', { '50' } }
      t['zz']    = { 'zz', { '50' } }
      t['zb']    = { 'zb', { '50' } }

      require('neoscroll.config').set_mappings(t)
    end
  },
  -- pick up where you left off
  {
    "ethanholz/nvim-lastplace",
    -- event = "BufRead",
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
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  -- surroundings
  { "kylechui/nvim-surround", event = "VeryLazy", },
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
  -- python support
  {
    'mfussenegger/nvim-dap-python',
    dependencies = {
      "nvim-neotest/neotest",
      "nvim-neotest/neotest-python",
      "nvim-neotest/nvim-nio",
    },
    ft = "python",
    keys = {
      -- { "<leader>dc", "<Cmd>lua require'dap'.continue()<CR>",          desc = "Dap Continue" },
      { "<leader>ds", "<Cmd>lua require'dap'.continue()<CR>", desc = "Dap Start" },
      -- { "<leader>dt", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", desc = "Toggle Breakpoint" },
    },
    config = function()
    end
  },
  -- lsp diagnostics highlight groups for non lsp colorschemes
  {
    "folke/lsp-colors.nvim",
    event = "BufRead",
  },
  -- TabNine completion engine for hrsh7th/nvim-cmp
  {
    "tzachar/cmp-tabnine",
    build = "./install.sh",
    dependencies = "hrsh7th/nvim-cmp",
    event = "InsertEnter",
  },
  -- hint when you type
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require "lsp_signature".on_attach() end,
  },
  -- go support plugin
  {
    "leoluz/nvim-dap-go",
    dependencies = {
      -- dap中启用虚拟文本插件
      "theHamsta/nvim-dap-virtual-text",
    },
    ft = "go",
    keys = {
      -- { "<leader>dc", "<Cmd>lua require'dap'.continue()<CR>",          desc = "Dap Continue" },
      { "<leader>ds", "<Cmd>lua require'dap'.continue()<CR>", desc = "Dap Start" },
      -- { "<leader>dt", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", desc = "Toggle Breakpoint" },
    },
    config = function()
    end
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function()
    end
  },
  -- {
  --   "fatih/vim-go",
  --   ft = "go",
  --   config = function()
  --   end
  -- },
  -- rust support plugin
  { "simrat39/rust-tools.nvim" },
  -- cwd to the project's root directory
  {
    "ahmedkhalf/lsp-rooter.nvim",
    event = "BufRead",
    config = function()
      require("lsp-rooter").setup()
    end,
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
  -- preview markdown in neovim
  -- You must install glow globally
  -- https://github.com/charmbracelet/glow
  -- yay -S glow
  {
    "npxbr/glow.nvim",
    ft = { "markdown" }
    -- build = "yay -S glow"
  },
  -- ========== colorthemes ==========
  -- {
  --     "sontungexpt/witch",
  --     priority = 900,
  --     lazy = false,
  --     config = function()
  --         require("witch").setup {
  --             style = "light",
  --             theme = {
  --                 extras = {
  --                     bracket = true,
  --                     dashboard = true,
  --                     diffview = true,
  --                     explorer = true,
  --                     -- indentline = true,
  --                 },
  --             },
  --             more_themes = {
  --                 dark1 = {
  --                     comment = "#ccc000",
  --                 }
  --             }
  --         }
  --     end,
  -- },
  -- {
  --     'arzg/vim-colors-xcode',
  --     config = function()
  --     end
  -- },
  {
    'projekt0n/github-nvim-theme',
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    confie = function()
      -- require('github-theme').setup({
      -- })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        background = { -- :h background
          light = "latte",
          dark = "mocha",
        },
        transparent_background = true, -- disables setting the background color.
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          hop = true,
          mason = true,
          which_key = true,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
        },
      })
    end
  },
  -- ========== colorthemes end ==========
  -- AI codeium
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    event = "InsertEnter",
    config = function ()
      require('codeium').setup()
    end
  },
  -- AI neoai
  {
    "Bryley/neoai.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    cmd = {
      "NeoAI",
      "NeoAIOpen",
      "NeoAIClose",
      "NeoAIToggle",
      "NeoAIContext",
      "NeoAIContextOpen",
      "NeoAIContextClose",
      "NeoAIInject",
      "NeoAIInjectCode",
      "NeoAIInjectContext",
      "NeoAIInjectContextCode",
    },
    -- keys = {
    --   { "<leader>as", desc = "summarize text" },
    --   { "<leader>ag", desc = "generate git message" },
    -- },
  },
  -- bookmark
  { "ChristianChiarulli/bookmark.nvim", event = "BufRead", dependencies = "kkharji/sqlite.lua" },
  -- { url = "git@github.com:ChristianChiarulli/onedark.nvim.git" },
  -- zen mode plugin
  { "folke/zen-mode.nvim",              event = "BufRead", dependencies = { "lvimuser/lsp-inlayhints.nvim" } },
  -- scrollbar
  { "petertriho/nvim-scrollbar",        event = "BufRead" },
  -- peeks lines of the buffer in non-obtrusive way
  { "nacro90/numb.nvim",                event = "BufRead" },
  -- run the code of any language with a single command
  { "is0n/jaq-nvim",                    event = "BufRead" },
  -- Partial implementation of LSP inlay hint
  { "lvimuser/lsp-inlayhints.nvim",     event = "BufRead" },
  -- translate plugin
  { 'uga-rosa/translate.nvim',          event = "BufRead" },
  -- cmp nerdfont
  { 'chrisgrieser/cmp-nerdfont',        event = "BufRead" },
}
