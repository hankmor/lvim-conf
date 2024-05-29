-- get neotest namespace (api call creates or returns namespace)
local neotest_ns = vim.api.nvim_create_namespace("neotest")
vim.diagnostic.config({
  virtual_text = {
    format = function(diagnostic)
      local message =
          diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
      return message
    end,
  },
}, neotest_ns)
require("neotest").setup({
  -- your neotest config here
  adapters = {
    require("neotest-go"),
    require("neotest-python"),
  },
})

lvim.builtin.which_key.mappings["dM"] = { "<cmd>:lua require('neotest').run.run()<cr>", "Test Method" }
lvim.builtin.which_key.mappings["dm"] =
{ "<cmd>:lua require('neotest').run.run({strategy = 'dap'})<cr>", "Test Method DAP" }
lvim.builtin.which_key.mappings["df"] = {
  "<cmd>:lua require('neotest').run.run({vim.fn.expand('%')})<cr>",
  "Test Class",
}
lvim.builtin.which_key.mappings["dF"] = {
  "<cmd>:lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>",
  "Test Class DAP",
}
lvim.builtin.which_key.mappings["dS"] = { "<cmd>:lua require('neotest').summary.toggle()<cr>", "Test Summary" }
