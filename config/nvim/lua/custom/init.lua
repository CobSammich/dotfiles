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
opt.virtualedit ="all"
opt.pumheight = 10      -- pop up menu height
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.completeopt = { "menuone", "noselect"}
opt.undofile = true


--- Autocommand to remove whitespace on file save
vim.api.nvim_command([[
    function! TrimWhiteSpace()
        let l:save = winsaveview()
        keeppatterns %s/\s\+$//e
        call winrestview(l:save)
    endfun

    autocmd BufWritePre * call TrimWhiteSpace()
]])
