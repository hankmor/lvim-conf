-- lvim.builtin.cmp.window = {
--   completion = {
--     border = "rounded",
--     -- winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,FloatBorder:FloatBorder,Search:None",
--     col_offset = -3,
--     side_padding = 1,
--     scrollbar = true,
--     -- scrollbar = {
--     --   position = 'inside',
--     -- },
--     scrolloff = 8,
--   },
--   documentation = {
--     border = "rounded",
--     -- winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,Search:None",
--   },
-- }
-- vim.opt.pumblend = 10

-- lvim.builtin.cmp.formatting.source_names = {}

-- lvim.builtin.cmp.sources[2].entry_filter = function(entry, ctx)
--   local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
--   if kind == "Snippet" and ctx.prev_context.filetype == "java" then
--     return false
--   end

--   if kind == "Text" and not ctx.prev_context.filetype == "markdown" then
--     return false
--   end

--   return true
-- end

local cmp_sources_table = lvim.builtin.cmp.sources

-- nerdfont
cmp_sources_table[#cmp_sources_table + 1] = {
  name = "nerdfont",
}

-- config cmp
cmp_sources_table[#cmp_sources_table + 1] = {
  name = "codeium",
}

