local api = vim.api

api.nvim_create_user_command('KoalaExampleUserCmd', function()
	vim.notify('This is an example for usercmd')
end, {})
