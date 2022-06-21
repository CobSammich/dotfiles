-- Spell Checking
vim.cmd[[hi clear SpellBad]]
vim.cmd[[hi SpellBad cterm=underline gui=undercurl ctermfg=red guisp=red guifg=red]]
vim.cmd[[hi clear SpellCap]]
vim.cmd[[hi SpellCap cterm=underline gui=undercurl ctermfg=lightred guisp=lightred guifg=orange]]

-- Honestly not sure what these are.. but they highlight actual words
vim.cmd[[hi clear SpellLocal]]
vim.cmd[[hi clear SpellRare]]
