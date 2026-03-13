-------------------------------------------------------------------------------
-- mini.files

require('mini.files').setup()
vim.keymap.set("n", "<leader>f", MiniFiles.open, { silent = true })

vim.cmd("highlight link NormalFloat Normal")
vim.cmd("highlight Pmenu ctermbg=grey guibg=grey27")
vim.cmd("highlight PmenuSel ctermbg=grey guibg=grey")
-- ref. https://github.com/neovim/neovim/issues/20698
-- ref. :help highlight-groups
-- ref. https://vi.stackexchange.com/questions/12664/is-there-any-way-to-change-the-popup-menu-color

local minifiles_setup_content = {
	prefix = (function(fs_entry)
		if fs_entry.fs_type == 'directory' then
			return '+ ', 'MiniFilesDirectory'
		elseif fs_entry.fs_type == 'file' then
			return '- ', 'MiniFilesFile'
		else
			return MiniFiles.default_prefix(fs_entry)
		end
	end),
}

-- Default configurations ref. https://nvim-mini.org/mini.nvim/doc/mini-files.html#minifiles.config-defaults
--[[
local minifiles_setup_mappings_default = {
	close       = 'q',
	go_in       = 'l',
	go_in_plus  = 'L',
	go_out      = 'h',
	go_out_plus = 'H',
	go_in       = '',
	go_in_plus  = 'l',
	go_out      = 'h',
	go_out_plus = 'H',
	mark_goto   = "'",
	mark_set    = 'm',
	reset       = '<BS>',
	reveal_cwd  = '@',
	show_help   = 'g?',
	synchronize = '=',
	trim_left   = '<',
	trim_right  = '>',
}
]]

local minifiles_setup_mappings_list = {
	{
		go_in       = '',
		go_in_plus  = 'l',
		go_out      = 'h',
		go_out_plus = 'H',
		reset       = '<Esc>',
		synchronize = 'sy',
	},
	{
		go_in       = '',
		go_in_plus  = 'gl',
		go_out      = 'gh',
		go_out_plus = '',
		reset       = '<Esc>',
		synchronize = 'sy',
	}
}

require('mini.files').setup({
	content = minifiles_setup_content,
	mappings = minifiles_setup_mappings_list[1],
})

local minifiles_setup_mappings_current = 1

local minifiles_toggle_mappings = (function()
	minifiles_setup_mappings_current = minifiles_setup_mappings_current + 1
	if minifiles_setup_mappings_current > #minifiles_setup_mappings_list then
		 minifiles_setup_mappings_current = 1
	end
	print(minifiles_setup_mappings_current)
	require('mini.files').setup({
		content = minifiles_setup_content,
		mappings = minifiles_setup_mappings_list[minifiles_setup_mappings_current],
	})
end)

vim.api.nvim_create_user_command("MiniFilesToggleMappings", minifiles_toggle_mappings, {})
