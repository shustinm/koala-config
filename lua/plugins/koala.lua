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
	},
})

return M
