local M = {}

-- Custom setup of KoalaVim
table.insert(M, {
	"KoalaVim/KoalaVim",
	opts = {
		autocmds = {
			half_screen = {
				full_screen_width = 168,
			},
		},
		plugins = {
			open_jira = {
				jira_url = "https://vastdata.atlassian.net/browse",
			},
		},
		lsp = {
			format = {
				-- type: string[]
				-- List of lsp clients to not apply format with
				blacklist = { "rust_analyzer", "ruff_lsp" },
			},
		},
	},
})

return M
