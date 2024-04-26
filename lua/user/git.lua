require("gitblame").setup { enabled = true }

lvim.builtin.gitsigns.opts.attach_to_untracked = true
vim.cmd "highlight default link gitblame SpecialComment"
vim.g.gitblame_enabled = 0
vim.g.gitblame_message_template = "<summary> • <date> • <author>"
vim.g.gitblame_highlight_group = "LineNr"
vim.g.gitblame_date_format = '%r'
vim.g.gist_open_browser_after_post = 1
