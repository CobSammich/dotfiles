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



local vimwiki_template = function()
    vim.cmd([[0r ~/.config/nvim/templates/vimwiki_daily_journal.md]])
    -- vim.cmd([[call append(2, "# " . split(expand('%:r'),'/')[-1])]])
    -- vim.cmd([[call append(2, strftime("# %F"))]])
    vim.cmd([[call append(2, strftime("## %A, %B %d %G (%r)"))]])

end

-- skeletons
vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "/home/cob/vimwiki/diary/*.md",
    group = vim.api.nvim_create_augroup("create_skeletons", { clear = true }),
    callback = vimwiki_template
})
