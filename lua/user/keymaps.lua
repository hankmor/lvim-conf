-- ======================================================
-- customize lsp keymap
-- ======================================================

lvim.lsp.buffer_mappings.normal_mode['H'] = { vim.lsp.buf.hover, "Show documentation" }
lvim.lsp.buffer_mappings.normal_mode['gk'] = lvim.lsp.buffer_mappings.normal_mode['K']
-- lvim.lsp.buffer_mappings.normal_mode['K'] = nil
-- lvim.keys.normal_mode['K'] = "<Cmd>echo Okay!<CR>"

-- ======================================================
-- customize keymaps with <leader> start
-- ======================================================


-- scissors
-- lvim.builtin.which_key.mappings["s"] = {
--     name = "Scissors",
--     e = { "<cmd>lua require('scissors').editSnippet()<cr>", "edit snippet" },
--     a = { "<cmd>lua require('scissors').addNewSnippet()<cr>", "add snippet" },
-- }
lvim.builtin.which_key.mappings["se"] = { "<cmd>lua require('scissors').editSnippet()<cr>", "edit snippet" }
lvim.builtin.which_key.mappings["sa"] = { "<cmd>lua require('scissors').addNewSnippet()<cr>", "add snippet" }


