local status_ok, todo_comments = pcall(require, "todo-comments")
if not status_ok then
  return
end

-- TODO: Add test cases.
-- FIX: Add test cases.
-- PERF: Add test cases.
-- NOTE: Add test cases.
-- WARNING: Add test cases.
-- HACK: Add test cases.
todo_comments.setup {
  signs = true,      -- show icons in the signs column
  highlight = {
    after = "empty", -- "fg" or "bg" or empty
  },
}
