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

return M
