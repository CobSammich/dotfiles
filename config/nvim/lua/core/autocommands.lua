
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
