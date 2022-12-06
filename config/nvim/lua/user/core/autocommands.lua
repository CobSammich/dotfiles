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

-- skeletons
vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "*.py",
    group = vim.api.nvim_create_augroup("create_skeletons", { clear = true }),
    command = "0r ~/.config/nvim/templates/skeleton.py"
})
