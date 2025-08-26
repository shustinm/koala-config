------------------------------
-- This file is the entry point of a neovim configuration
--
-- If vim.g.vscode exists, load the vscode configuration. 
-- Otherwise, koalavim configuration is loaded
--
-- In order to load the config with KoalaVim we load:
--     1. KoalaVim config - keymaps, options, usercmds, autocmds
--     2. User config - keymaps, options, usercmds, autocmds (Overrides KoalaVim config)
--     3. lazy.nvim - Loads the plugins
------------------------------

if vim.g.vscode then
	-- remap leader key
	vim.keymap.set("n", "<Space>", "", opts)
	vim.g.mapleader = " "
	vim.g.maplocalleader = " "


	-- Bootstrap lazy.nvim
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.loop.fs_stat(lazypath) then
	  vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	  })
	end
	vim.opt.rtp:prepend(lazypath)

	require("lazy").setup({
		{
			'nguyenvukhang/nvim-toggler',
			opts = {
				inverses = {
					['to'] = 'from',
					['failed'] = 'succeeded',
					['before'] = 'after',
					['prev'] = 'next',
					['above'] = 'below',
					['start'] = 'end',
					['vertical'] = 'horizontal',
					['False'] = 'True',
				},
				remove_default_keybinds = true,
			},
			config = function(_, opts)
				require('nvim-toggler').setup(opts)
			end,
			keys = {
				{
					'<leader>i',
					function()
						require('nvim-toggler').toggle()
					end,
					mode = { 'n', 'v' },
					desc = 'Invert words',
				},
			},
		}
	})

	require('user.vscode_keymaps')
else
	------------------------------
	-- Remap space as leader key to set the keymaps with correct leader key
	------------------------------
	local leader_key = ' '

	------------------------------
	-- Load KoalaVim config
	------------------------------
	require('koala_init').load_koala(leader_key)

	------------------------------
	-- Load user config
	------------------------------
	local require_dir = require('KoalaVim.utils.require_dir')
	require_dir.recursive_require('config')

	-- Lazy load config/lazy after KoalaVim
	vim.api.nvim_create_autocmd('User', {
		pattern = 'KoalaVimStarted',
		callback = function()
			require_dir.recursive_require('config_lazy')
		end,
	})

	------------------------------
	-- Load lazy.nvim
	------------------------------
	require('koala_init').load_lazy {
		-- lazy.nvim user spec (combined with KoalaVim spec)
		user_spec = {
			{ import = 'plugins' },
		},
		-- lazy.nvim user opts (overrides KoalaVim lazy.nvim opts)
		lazy_opts = {
			install = {
				-- TODO: [configure me] set your colorscheme
				colorscheme = { 'ofirkai' }, -- Which colorscheme to let lazy.nvim load first
			},
		},
	}
end
