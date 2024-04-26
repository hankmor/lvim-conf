-- ======================================================
-- customize keymap
-- ======================================================

-- Mapping window
lvim.builtin.which_key.mappings["w"] = {
  name = "Window",
  h = { ":split<CR>", "Split Horizonal" },
  v = { ":vsplit<CR>", "Split Vertical" },
  H = { "<C-w>b<C-w>H", "Toggle Vertical" },
  V = { "<C-w>b<C-w>K", "Toggle Horizonal" },
}

-- go to head/tail of a line
lvim.keys.normal_mode["<M-S-left>"] = "^"
lvim.keys.normal_mode["<M-S-right>"] = "$"

-- Resize window fastly
lvim.keys.normal_mode["<M-up>"] = ":res -5<cr>"
lvim.keys.normal_mode["<M-down>"] = ":res +5<cr>"
lvim.keys.normal_mode["<M-left>"] = ":vertical resize+5<cr>"
lvim.keys.normal_mode["<M-right>"] = ":vertical resize-5<cr>"

-- Go to window fastly
lvim.keys.normal_mode["<C-h>"] = false
lvim.keys.normal_mode["<C-j>"] = false
lvim.keys.normal_mode["<C-k>"] = false
lvim.keys.normal_mode["<C-l>"] = false
lvim.builtin.which_key.mappings["<up>"] = { "<C-w>k", "Go to Top Window" }
lvim.builtin.which_key.mappings["<down>"] = { "<C-w>j", "Go to Bottom Window" }
lvim.builtin.which_key.mappings["<left>"] = { "<C-w>h", "Go to Left Window" }
lvim.builtin.which_key.mappings["<right>"] = { "<C-w>l", "Go to Right Window" }

-- quit term mode
lvim.keys.term_mode["<M-q>"] = "<C-\\><C-n>"

-- remove keymap, duplicate with <leader>gb
-- lvim.builtin.which_key.mappings["s"]["b"] = false

-- ======================================================
-- customize plugin keymaps
-- ======================================================

-- lsp
-- outline
lvim.builtin.which_key.mappings["lh"] = { "<Cmd>:SymbolsOutline<CR>", "Show Outline" }

-- scissors
lvim.builtin.which_key.mappings["S"] = {
  name = "Snippets",
  e = { "<Cmd>lua require('scissors').editSnippet()<CR>", "Edit Snippet" },
  a = { "<Cmd>lua require('scissors').addNewSnippet()<CR>", "Add Snippet" },
}

-- select buffer
lvim.builtin.which_key.mappings["bs"] = { "<Cmd>:BufferLinePick<CR>", "Pick Buffer" }
lvim.builtin.which_key.mappings["bx"] = { "<Cmd>:BufferLineCloseOthers<CR>", "Close Other" } -- close other

-- hop
lvim.keys.normal_mode["s"] = ":HopChar2<cr>"
lvim.keys.normal_mode["S"] = ":HopWord<cr>"

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
lvim.keys.normal_mode["<C-M-l>"] = "<Cmd>:GoFmt<CR>"
lvim.keys.insert_mode["<C-M-l>"] = "<Cmd>:GoFmt<CR>"
lvim.keys.normal_mode["<C-M-r>"] = "<Cmd>:GoRun<CR>"
lvim.keys.normal_mode["<C-M-t>"] = "<Cmd>:GoTestFunc<CR>"
lvim.keys.normal_mode["<C-M-i>"] = "<Cmd>:GoImpl<CR>"
lvim.keys.normal_mode["<C-S-i>"] = "<Cmd>:GoImports<CR>"

-- nvim-window
lvim.builtin.which_key.mappings["sw"] = { "<Cmd>lua require('nvim-window').pick()<CR>", "Pick Window" }

-- bookmark
lvim.builtin.which_key.mappings["s"]["b"] = { "<cmd>:Telescope bookmark filemarks<CR>", "Search Bookmarks" }
lvim.builtin.which_key.mappings["B"] = {
  name = "Bookmarks",
  t = { "<cmd>:BookmarkToggle<CR>", "Toggle" },
  n = { "<cmd>:BookmarkNext<CR>", "Next" },
  p = { "<cmd>:BookmarkPrev<CR>", "Prev" },
  l = { "<cmd>:BookmarkList<CR>", "List" },
  c = { "<cmd>:BookmarkClear<CR>", "Clear" },
  C = { "<cmd>:BookmarkClearProject<CR>", "Clear Project" },
}
-- filemark
lvim.builtin.which_key.mappings["F"] = {
  name = "Filemarks",
  t = { "<cmd>:FilemarkToggle<CR>", "Toggle" },
  n = { "<cmd>:FilemarkNext<CR>", "Next" },
  p = { "<cmd>:FilemarkPrev<CR>", "Prev" },
  l = { "<cmd>:FilemarkList<CR>", "List" },
}

-- zen mode
lvim.keys.normal_mode["<C-z>"] = "<Cmd>:ZenMode<CR>"

-- todo comments
lvim.builtin.which_key.mappings["i"] = {
  name = "Todo Comments",
  q = { "<cmd>:TodoQuickFix<CR>", "Quick Fix" },
  l = { "<cmd>:TodoLocList<CR>", "Loc List" },
  t = { "<cmd>:TodoTrouble<CR>", "Trouble" },
  s = { "<cmd>:TodoTelescope<CR>", "Telescope" },
}

-- AI neoai etc.
lvim.builtin.which_key.mappings["a"] = {
  name = "NeoAI Keymaps",
  o = { "<cmd>:NeoAI<CR>", "Toggle Open" },
  c = { "<cmd>:NeoAIContext<CR>", "Toggle Open Context" },
  i = { "<cmd>:NeoAIInject<CR>", "Toggle Inject" },
  g = { "<cmd>:NeoAIInjectContext<CR>", "Toggle Inject Context" },
}
