local status_ok, todo_comments = pcall(require, "translate")
if not status_ok then
  return
end

require("translate").setup({
  default = {
    -- command = "deepl_pro", // comment to use google as default
  },
  preset = {
    output = {
      split = {
        append = true,
      },
    },
  },
})

lvim.builtin.which_key.mappings["T"] = {
  name = "Translate Keymaps",
  e = { "<cmd>:Translate EN<CR>", "Translate To EN" },
  z = { "<cmd>:Translate ZH<CR>", "Translate To ZH" },
  w = { "viw:Translate ZH<CR>", "Translate current word to ZH" }
}
