if vim.fn.has("syntax") then
	vim.cmd("syntax on")
end

vim.cmd("set t_Co=256")
vim.opt.relativenumber = true
vim.opt.showcmd = true
vim.opt.virtualedit = "all"
vim.opt.wrap = false
vim.opt.backspace = "indent,eol,start"
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.fileencodings = "utf-8,sjis,utf-16le,euc-jp,iso-2022-jp"
vim.opt.fileformats = "unix,mac,dos"
vim.cmd("set visualbell t_vb=")
vim.opt.encoding = "utf-8"
vim.opt.list = true
vim.opt.listchars = "tab:>.,trail:_,extends:\\"
vim.opt.tabstop = 2
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.hlsearch = true
vim.opt.scrolloff = 4
vim.opt.sidescroll = 1
vim.opt.sidescrolloff = 0
vim.opt.shiftwidth = 2
-- %t: filename, %{&fenc}: file-encoding, %{&ff}: file-format, %y: filetype, %m: [+] if modified, %=: separator, %l: row, %v: col, %p: pos
-- ref. https://qiita.com/Cj-bc/items/dbe62075474c0e29a777
vim.opt.statusline = "%t [%{&fenc}/%{&ff}]%y %m%=%l %v %3p%%"

if vim.fn.has("mac") == 0 then
	vim.opt.clipboard = "unnamedplus"
end
-- TODO: Research: has("mac") is still needed?

vim.g.mapleader = ","

vim.cmd("filetype indent on")

vim.keymap.set("n", ";", ":", {})
vim.keymap.set("n", ":", ";", {})
vim.keymap.set("n", "ss", ":w<CR>", {})
vim.keymap.set("n", "sq", ":wq<CR>", {})
vim.keymap.set("n", "tc", ":tabnew<CR>", { silent = true })
vim.keymap.set("n", "tC", ":-tabnew<CR>", { silent = true })
vim.keymap.set("n", "t>", ":+tabmove<CR>", { silent = true })
vim.keymap.set("n", "t<", ":-tabmove<CR>", { silent = true })
vim.keymap.set("n", "t.", ":+tabmove<CR>", { silent = true })
vim.keymap.set("n", "t,", ":-tabmove<CR>", { silent = true })
vim.keymap.set("i", "kk", "<Esc>", {})
vim.keymap.set("i", "jj", "<Esc>", {})
vim.keymap.set("n", "ff", ":<C-u>nohlsearch<CR>", {})
vim.keymap.set("n", "j", "gj", {})
vim.keymap.set("n", "k", "gk", {})
vim.keymap.set("n", "gy", "%", {})
vim.keymap.set("v", "j", "gj", {})
vim.keymap.set("v", "k", "gk", {})
vim.keymap.set("v", "ff", "<Esc>", {})
vim.keymap.set("n", "<Left>", "<C-w><", {})
vim.keymap.set("n", "<Right>", "<C-w>>", {})
vim.keymap.set("n", "<Down>", "<C-w>+", {})
vim.keymap.set("n", "<Up>", "<C-w>-", {})
vim.keymap.set("n", "K", "<Nop>", {})
vim.keymap.set("v", "K", "<Nop>", {})
-- Enable to move cursor in command mode
vim.keymap.set("c", "<C-a>", "<Home>", {})
vim.keymap.set("c", "<C-e>", "<End>", {})
vim.keymap.set("c", "<C-b>", "<Left>", {})
vim.keymap.set("c", "<C-f>", "<Right>", {})
vim.keymap.set("c", "<C-d>", "<Delete>", {})

-- Easy window/tab change
vim.keymap.set("n", "gp", ":bp<CR>", {})
vim.keymap.set("n", "gn", ":bn<CR>", {})
vim.keymap.set("n", "gj", "<C-w>j", {})
vim.keymap.set("n", "gk", "<C-w>k", {})
vim.cmd([[
function s:movewinleft()
  let before = winnr()
  wincmd h
  if before == winnr()
    tabprevious
  endif
endfunction
nnoremap <silent> gh :call <SID>movewinleft()<CR>
function s:movewinright()
  let before = winnr()
  wincmd l
  if before == winnr()
    tabnext
  endif
endfunction
nnoremap <silent> gl :call <SID>movewinright()<CR>
]])

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "lua" },
	callback = function()
		vim.opt.expandtab = false
		vim.opt.tabstop = 4
		vim.opt.shiftwidth = 4
	end,
})
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "json" },
	callback = function()
		vim.opt_local.conceallevel = 0
	end,
})
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "markdown" },
	callback = function()
		vim.opt_local.conceallevel = 0
	end,
})
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "go" },
	callback = function()
		vim.opt.expandtab = false
	end,
})
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "make" },
	callback = function()
		vim.opt.expandtab = false
	end,
})
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "python" },
	callback = function()
		vim.opt.shiftwidth = 4
	end,
})
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "groovy" },
	callback = function()
		vim.opt.shiftwidth = 4
	end,
})
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "*.gradle" },
	callback = function()
		vim.opt.filetype = "groovy"
	end,
})

-- *last-position-jump*
-- ref. http://vimdoc.sourceforge.net/htmldoc/eval.html#last-position-jump
-- Fix to enable to jump to the maximum line. ref. https://github.com/kaosf/dotfiles/commit/54a9967af77b65d0babf1f3bf05e0358f45a3c32
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
	pattern = { "*" },
	callback = function()
		local l = vim.fn.line("'\"")
		local l_max = vim.fn.line("$")
		if l < 1 then
			l = 1
		end
		if l > l_max then
			l = l_max
		end
		vim.cmd("normal! " .. l .. "G")
	end,
})

-- Command for "Where is This file?"
vim.api.nvim_create_user_command("WT", "echo @%", {})

-- Easy wrap/unwrap switch
vim.api.nvim_create_user_command("Swrap", "set wrap", {})
vim.api.nvim_create_user_command("Snwrap", "set nowrap", {})

-- Change directory to the current file's directory
-- ref. http://qiita.com/shiena/items/1e98fd14d0ef0084b17f
vim.api.nvim_create_user_command("Cdf", "cd %:h", {})

-- MRU with vanilla
-- ref. https://qiita.com/todashuta/items/1362654c6276e5b69abc
vim.keymap.set("n", "<Leader>m", ":<C-u>/ oldfiles<Home>browse filter /", {})

-- Highlight zenkaku spaces
-- ref. http://inari.hatenablog.com/entry/2014/05/05/231307
vim.cmd([[
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=238 gui=reverse guifg=cyan
endfunction
if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme       * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif
]])

-- Reload command
vim.api.nvim_create_user_command("Reload", ":source ~/.config/nvim/init.lua", {})

-- Plugin Manager **Dein**
if vim.fn.filereadable(vim.env.HOME .. "/.config/nvim/dein.vim") ~= 0 then
	vim.cmd("source ~/.config/nvim/dein.vim")
end

-- Local configuration
if vim.fn.filereadable(vim.env.HOME .. "/.config/nvim/init-local.vim") ~= 0 then
	vim.cmd("source ~/.config/nvim/init-local.vim")
end
if vim.fn.filereadable(vim.env.HOME .. "/.config/nvim/lua/init-local.lua") ~= 0 then
	require("init-local")
end
