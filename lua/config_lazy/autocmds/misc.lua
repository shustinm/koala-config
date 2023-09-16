local api = vim.api

local config_autocmds = api.nvim_create_augroup("config", { clear = true })

-- Enable spell for .txt files
vim.api.nvim_create_autocmd("FileType", {
	group = config_autocmds,
	pattern = { "text" },
	callback = function()
		vim.opt_local.spell = true
	end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
	group = config_autocmds,
	pattern = { "*" },
	callback = function()
		vim.opt_local.relativenumber = false
	end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
	group = config_autocmds,
	pattern = { "*" },
	callback = function()
		vim.opt_local.relativenumber = true
	end,
})
