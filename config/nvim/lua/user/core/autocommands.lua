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
vim.cmd [[au FileType vimwiki set syntax=pandoc]]
-- vim.cmd [[au FileType vimwiki set filetype=markdown]]

-- vim.cmd [[set foldtext=getline(v:foldstart+1)]]
vim.cmd [[autocmd FileType python setlocal foldenable foldmethod=syntax]]
