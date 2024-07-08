local status_ok, _ = pcall(require, "venv-selector")
if not status_ok then
	return
end

require("venv-selector").opts = {
	name = { ".venv", "venv" },
	path = "~/.venvs/",
	parents = 0,
	auto_refresh = false,
	stay_on_this_version = true,
	dap_enabled = true,
}

vim.api.nvim_create_autocmd("VimEnter", {
	desc = "Auto select virtualenv Nvim open",
	pattern = "*",
	callback = function()
		local venv = vim.fn.findfile("pyproject.toml", vim.fn.getcwd() .. ";")
		if venv ~= "" then
			require("venv-selector").retrieve_from_cache()
		end
	end,
	once = true,
})
