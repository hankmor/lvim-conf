-- ======================================================
-- customize lsp keymap
-- ======================================================

lvim.lsp.buffer_mappings.normal_mode['H'] = { vim.lsp.buf.hover, "Show documentation" }
lvim.lsp.buffer_mappings.normal_mode['gk'] = lvim.lsp.buffer_mappings.normal_mode['K']
lvim.lsp.buffer_mappings.normal_mode['M-k'] = lvim.lsp.buffer_mappings.normal_mode['K']

-- ======================================================
-- customize keymaps with <leader> start
-- ======================================================

-- scissors
lvim.builtin.which_key.mappings["se"] = { "<cmd>lua require('scissors').editSnippet()<cr>", "edit snippet" }
lvim.builtin.which_key.mappings["sa"] = { "<cmd>lua require('scissors').addNewSnippet()<cr>", "add snippet" }

