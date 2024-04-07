-- ======================================================
-- customize keymap
-- ======================================================

-- Split horizonal and vertical window
lvim.keys.normal_mode["|"] = ":vsplit<CR>"
lvim.keys.normal_mode["-"] = ":split<CR>"
lvim.builtin.which_key.mappings["\\"] = { "<C-w>b<C-w>H", "Toggle Vertical Window" }
lvim.builtin.which_key.mappings["-"] = { "<C-w>b<C-w>K", "Toggle Horizonal Window" }

-- Resize window fastly
vim.keymap.set("n", "<M-up>", ":res -5<cr>")
vim.keymap.set("n", "<M-down>", ":res +5<cr>")
vim.keymap.set("n", "<M-left>", ":vertical resize+5<cr>")
vim.keymap.set("n", "<M-right>", ":vertical resize-5<cr>")

-- Go to window fastly
lvim.builtin.which_key.mappings["<up>"] = { "<C-w>k", "Go to Top Window"}
lvim.builtin.which_key.mappings["<down>"] = { "<C-w>j", "Go to Bottom Window" }
lvim.builtin.which_key.mappings["<left>"] = { "<C-w>h", "Go to Left Window" }
lvim.builtin.which_key.mappings["<right>"] = { "<C-w>l", "Go to Right Window" }

-- ======================================================
-- customize plugin keymaps
-- ======================================================

-- lsp
lvim.lsp.buffer_mappings.normal_mode['H'] = { vim.lsp.buf.hover, "Show documentation" }
-- scissors
lvim.builtin.which_key.mappings["se"] = { "<Cmd>lua require('scissors').editSnippet()<CR>", "Edit Snippet" }
lvim.builtin.which_key.mappings["sa"] = { "<Cmd>lua require('scissors').addNewSnippet()<CR>", "Add Snippet" }
-- select buffer
lvim.builtin.which_key.mappings["bs"] = { "<Cmd>:BufferLinePick<CR>", "Pick Buffer" }
lvim.builtin.which_key.mappings["bx"] = { "<Cmd>:BufferLineCloseOthers<CR>", "Close Other" } -- close other
-- hop
lvim.keys.normal_mode["s"] = ":HopChar2<cr>"
lvim.keys.normal_mode["S"] = ":HopWord<cr>"
-- outline
lvim.builtin.which_key.mappings["gh"] = { "<Cmd>:SymbolsOutline<CR>", "Show Outline" }
-- trouble
lvim.builtin.which_key.mappings["t"] = {
    name = "Diagnostics",
    t = { "<cmd>TroubleToggle<cr>", "trouble" },
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
    l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
    r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}
-- go.nvim
lvim.keys.normal_mode["<C-A-l>"] = ":GoFmt<CR>"
lvim.keys.insert_mode["<C-A-l>"] = ":GoFmt<CR>"
lvim.keys.normal_mode["<C-A-r>"] = ":GoRun<CR>"
lvim.keys.normal_mode["<C-A-t>"] = ":GoTestFunc<CR>"
lvim.keys.normal_mode["<C-A-i>"] = ":GoImpl<CR>"
lvim.keys.normal_mode["<C-S-i>"] = ":GoImports<CR>"
-- nvim-window
lvim.builtin.which_key.mappings["sw"] = { "<Cmd>lua require('nvim-window').pick()<CR>", "Pick Window" }

