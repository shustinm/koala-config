local M = {}


-- Disable telescope-dict, clone fails
table.insert(M, {
	'lazy/telescope-dict.nvim',
	enabled = false,
})

-- Disable fugit2, WIP by OG
table.insert(M, {
	'lazy/fugit2.nvim',
	enabled = false,
})

-- Disable format-on-leave, WIP by AT (for 0.10)
table.insert(M, {
	'ofirgall/format-on-leave.nvim',
	enabled = false,
})

return M
