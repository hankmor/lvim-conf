local status_ok, _ = pcall(require, "typescript-tools")
if not status_ok then
	return
end

local api = require("typescript-tools.api")
require("typescript-tools").setup({
	handlers = {
		-- ignore special errors
		["textDocument/publishDiagnostics"] = api.filter_diagnostics(
			-- Ignore 'This may be converted to an async function' diagnostics.
			{ 80006 }
		),
	},
	settings = {
		tsserver_file_preferences = function(ft)
			-- Some "ifology" using `ft` of opened file
			return {
				includeInlayParameterNameHints = "all",
				includeCompletionsForModuleExports = true,
				quotePreference = "auto",
			}
		end,
		tsserver_format_options = function(ft)
			-- Some "ifology" using `ft` of opened file
			return {
				allowIncompleteCompletions = false,
				allowRenameOfImportPath = true,
			}
		end,
		tsserver_plugins = {
			-- for TypeScript v4.9+
			"@styled/typescript-styled-plugin",
			-- or for older TypeScript versions
			-- "typescript-styled-plugin",
		},
	},
})
