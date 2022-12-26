-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

--- Autocommand to remove whitespace on file save
vim.api.nvim_command([[
    function! TrimWhiteSpace()
        let l:save = winsaveview()
        keeppatterns %s/\s\+$//e
        call winrestview(l:save)
    endfun

    autocmd BufWritePre * call TrimWhiteSpace()
]])

-- Vimiwki related
vim.cmd([[au FileType vimwiki set syntax=pandoc]])
-- vim.cmd [[au FileType vimwiki set filetype=markdown]]

-- vim.cmd [[set foldtext=getline(v:foldstart+1)]]
vim.cmd([[autocmd FileType python setlocal foldenable foldmethod=syntax]])


---------------------
----- TEMPLATES -----
---------------------
-- All notes template
local vimwiki_template = function()
    local filename = vim.fn.expand("%:p")
    -- Check if we are in the daily notes subdir, if we are then don't use this
    -- template.
    if string.find(filename, "/home/cob/vimwiki/diary/") then
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
    pattern = "/home/cob/vimwiki/*.md",
    group = vim.api.nvim_create_augroup("basic_template", { clear = true }),
    callback = vimwiki_template
})

vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "/home/cob/vimwiki/diary/*.md",
    group = vim.api.nvim_create_augroup("daily_journal_template", { clear = true }),
    callback = vimwiki_daily_journal_template
})

