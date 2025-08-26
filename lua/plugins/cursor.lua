local M = {}

-- AT cursor config
table.insert(M, {
	"sphamba/smear-cursor.nvim",
    opts = {
		stiffness = 0.8,
		trailing_stiffness = 0.5,
		distance_stop_animating = 0.5,
		smear_between_neighbor_lines = false,
		hide_target_hack = false,
	},
})

return M

