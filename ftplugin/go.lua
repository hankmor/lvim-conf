-- single config for go file
vim.cmd("setlocal tabstop=4 shiftwidth=4")

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "goimports", filetypes = { "go" } },
  { command = "gofumpt",   filetypes = { "go" } },
}

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "gopls" })

local lsp_manager = require "lvim.lsp.manager"
lsp_manager.setup("golangci_lint_ls", {
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
})

lsp_manager.setup("gopls", {
  on_attach = function(client, bufnr)
    require("lvim.lsp").common_on_attach(client, bufnr)
    local _, _ = pcall(vim.lsp.codelens.refresh)
  end,
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
  settings = {
    gopls = {
      usePlaceholders = true,
      gofumpt = true,
      codelenses = {
        generate = false,
        gc_details = true,
        test = true,
        tidy = true,
      },
    },
  },
})

local status_ok, gopher = pcall(require, "gopher")
if not status_ok then
  return
end

gopher.setup {
  commands = {
    go = "go",
    gomodifytags = "gomodifytags",
    gotests = "gotests",
    impl = "impl",
    iferr = "iferr",
  },
}

------------------------
-- Language Key Mappings
------------------------

------------------------
-- Dap
------------------------
local dap = require("dap")
local dap_ok, dapgo = pcall(require, "dap-go")
if not dap_ok then
  return
end

local function config_keymap()
  -- keymapping to Jetbrains
  vim.keymap.set('n', '<F8>', function() dap.step_over() end)
  vim.keymap.set('n', '<F7>', function() dap.step_into() end)
  vim.keymap.set('n', '<F9>', function() dap.step_out() end)
  vim.keymap.set('n', '<F10>', function() dap.continue() end)

  -- local widgets = require('dap.ui.widgets')
  -- vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
  --     widgets.hover()
  -- end)
  -- vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
  --     widgets.preview()
  -- end)
  -- vim.keymap.set('n', '<Leader>df', function()
  --     widgets.centered_float(widgets.frames)
  -- end)
  -- vim.keymap.set('n', '<Leader>ds', function()
  --     widgets.centered_float(widgets.scopes)
  -- end)
end

dapgo.setup()
config_keymap()

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local opts = {
  mode = "n",     -- NORMAL mode
  prefix = "<leader>",
  buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,  -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true,  -- use `nowait` when creating keymaps
}

local mappings = {
  r = {
    name = "Go",
    i = { "<cmd>GoInstallDeps<Cr>", "Install Go Dependencies" },
    f = { "<cmd>GoMod tidy<cr>", "Tidy" },
    a = { "<cmd>GoTestAdd<Cr>", "Add Test" },
    A = { "<cmd>GoTestsAll<Cr>", "Add All Tests" },
    e = { "<cmd>GoTestsExp<Cr>", "Add Exported Tests" },
    g = { "<cmd>GoGenerate<Cr>", "Go Generate" },
    G = { "<cmd>GoGenerate %<Cr>", "Go Generate File" },
    c = { "<cmd>GoCmt<Cr>", "Generate Comment" },
    I = { "<cmd>GoImpl<Cr>", "Implements Interface" },
    t = { "<cmd>lua require('dap-go').debug_test()<cr>", "Debug Test" },
  },
}

which_key.register(mappings, opts)

-- require("nvim-dap-virtual-text").setup()

-- local function dapGo()
--     -- go debug delve
--     require('dap-go').setup() -- 启动 nvim-dap-go
--     dap.adapters.delve = {
--         path = "dlv",
--         initialize_timeout_sec = 20,
--         type = 'server',
--         port = '${port}',
--         host = "127.0.0.1",
--         args = { "-ip", "ip" },
--         build_flags = "",
--         detached = true,
--         executable = {
--             command = 'dlv',
--             args = { 'dap', '-l', '127.0.0.1:${port}', "--log", "--log-output='logs/dap'" },
--         }
--     }
--     -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
--     dap.configurations.go = {
--         {
--             type = "delve",
--             name = "Launch Package",
--             request = "launch",
--             program = "${fileDirname}",
--             args = {},
--         },
--         {
--             type = "delve",
--             name = "Debug Main",
--             request = "launch",
--             program = "${file}"
--         },
--         {
--             type = "delve",
--             name = "Debug test", -- configuration for debugging test files
--             request = "launch",
--             mode = "test",
--             program = "${file}"
--         },
--         -- {
--         --     type = "delve",
--         --     name = "Exec bin",
--         --     request = "exec",
--         --     file = "${file}",
--         -- },
--         {
--             type = "delve",
--             name = "Attach Picked Process",
--             request = "attach",
--             processId = require("dap.utils").pick_process
--             -- program = "${file}"
--         },
--         {
--             type = "",
--             name = "Attach remote",
--             mode = "remote",
--             request = "attach",
--         },
--         {
--             type = "delve",
--             name = "Attach (127.0.0.1:8000)",
--             mode = "remote",
--             request = "attach",
--             port = "8000"
--         },
--         -- works with go.mod packages and sub packages
--         {
--             type = "delve",
--             name = "Debug Test (go.mod)",
--             request = "launch",
--             mode = "test",
--             program = "./${relativeFileDirname}"
--         }
--     }
-- end
