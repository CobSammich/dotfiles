-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

local opt = vim.opt
local g = vim.g

opt.mouse = "nv"
opt.cursorline = true
opt.wrap = false
opt.virtualedit = "all"
opt.pumheight = 10 -- pop up menu height
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.completeopt = { "menuone", "noselect" }
opt.undofile = true

------------------
-- Autocommands --
------------------

--- Autocommand to remove whitespace on file save
vim.api.nvim_command([[
    function! TrimWhiteSpace()
        let l:save = winsaveview()
        keeppatterns %s/\s\+$//e
        call winrestview(l:save)
    endfun

    autocmd BufWritePre * call TrimWhiteSpace()
]])

vim.api.nvim_command([[
  autocmd bufreadpre *.md,*.tex,*.txt setlocal textwidth=80
]])

---------------------
----- TEMPLATES -----
---------------------
-- All notes template
local vimwiki_template = function()
	local filename = vim.fn.expand("%:p")
	-- Check if we are in the daily notes subdir, if we are then don't use this
	-- template.
	if string.find(filename, "/vimwiki/diary/") then
		return
	end
	vim.cmd([[0r ~/vimwiki/templates/default_template.md]])
	vim.cmd([[:%s/{date}/\=strftime("%A, %B %d %G")]])
	vim.cmd([[:%s/{time}/\=strftime("%r")]])
end
-- Daily journal template
local vimwiki_daily_journal_template = function()
	vim.cmd([[0r ~/vimwiki/templates/daily_journal_template.md]])
	vim.cmd([[:%s/{date}/\=strftime("%A, %B %d %G")]])
	vim.cmd([[:%s/{time}/\=strftime("%r")]])
end

vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = "*/vimwiki/*.md",
	group = vim.api.nvim_create_augroup("basic_template", { clear = true }),
	callback = vimwiki_template,
})

vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = "*/vimwiki/diary/*.md",
	group = vim.api.nvim_create_augroup("daily_journal_template", { clear = true }),
	callback = vimwiki_daily_journal_template,
})
