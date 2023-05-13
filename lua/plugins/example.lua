local M = {}

-----------------------------------------------------------------------------
--
-- This file contains examples for how to configure plugins with lazy + koala
--
-- The default directory of KoalaVim is ~/.local/share/nvim/lazy/KoalaVim
--    as known as $XDG_DATA_HOME/nvim
--
-----------------------------------------------------------------------------

-- Example for disabling a random KoalaVim's plugin
table.insert(M, {
	-- Preview's goto line before jumping `:<num>`
	'nacro90/numb.nvim',
	enabled = false,
})

-- TODO: example for overriding opts
-- TODO: exmaple for koala_unset

return M
