local status_ok, codeium = pcall(require, "codeium")
if not status_ok then
  return
end

codeium.setup({
  enable_local_search = true,
  enable_chat = true,
})
