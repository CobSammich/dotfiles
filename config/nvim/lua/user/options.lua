local options = {
    backup = false,                          -- creates a backup file
    clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
    cmdheight = 2,                           -- more space in the neovim command line for displaying messages
    completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    conceallevel = 0,                        -- so that `` is visible in markdown files
    fileencoding = "utf-8",                  -- the encoding written to a file
    hlsearch = true,                         -- highlight all matches on previous search pattern
    ignorecase = true,                       -- ignore case in search patterns
    mouse = "nv",                             -- allow the mouse to be used in neovim
    pumheight = 10,                          -- pop up menu height
    showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
    showtabline = 2,                         -- always show tabs
    smartcase = true,                        -- smart case
    smartindent = true,                      -- make indenting smarter again
    splitbelow = true,                       -- force all horizontal splits to go below current window
    splitright = true,                       -- force all vertical splits to go to the right of current window
    swapfile = false,                        -- creates a swapfile
    termguicolors = true,                    -- set term gui colors (most terminals support this)
    timeoutlen = 100,                        -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true,                         -- enable persistent undo
    updatetime = 300,                        -- faster completion (4000ms default)
    writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true,                        -- convert tabs to spaces
    shiftwidth = 4,                          -- the number of spaces inserted for each indentation
    tabstop = 4,                             -- insert 2 spaces for a tab
    cursorline = true,                       -- highlight the current line
    number = true,                           -- set numbered lines
    relativenumber = false,                  -- set relative numbered lines
    numberwidth = 4,                         -- set number column width to 2 {default 4}
    signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
    wrap = false,                            -- display lines as one long line
    scrolloff = 8,                           -- is one of my fav
    sidescrolloff = 8,
    guifont = "monospace:h17",               -- the font used in graphical neovim applications
    virtualedit = "all",
    -- highlight = "cursorline",
    textwidth = 100,
    laststatus = 3                           -- global statusline
}

vim.opt.shortmess:append "c"
vim.opt.background = "dark"
-- vim.opt.formatoptions:append "cro"
--vim.opt.highlight:append "cursorline" -- = "cursorline",

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions+=cro]] -- TODO: this doesn't seem to work
-- vim.cmd [[filetype plugin indent on]] -- TODO: this doesn't seem to work
vim.cmd [[let g:vimwiki_list = [{
            \ 'path': '~/vimwiki',
            \ 'template_path': '~/vimwiki/templates/',
            \ 'template_default': 'default',
            \ 'template_ext': '.html',
            \ 'syntax': 'markdown',
            \ 'ext': '.md',
            \ 'path_html': '~/vimwiki/site_html/',
            \ 'custom_wiki2html': 'vimwiki_markdown'}]
        ]]

-- '$HOME/Scripts/vimwiki2html.sh'
vim.cmd [[let g:vimwiki_hl_headers = 1]]
-- Don't allow all markdown files to be vimwiki files
vim.cmd [[let g:vimwiki_global_ext = 0]]
-- Use code syntax highlighitng within vimwiki pages.
vim.cmd [[let g:markdown_fenced_languages = ['python', 'cpp', 'c', 'rust', 'vim',
                                 \ 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript',
                                 \ 'ruby', 'sass', 'xml', 'html']
        ]]
-- Disable hiding tick marks for code blocks -- default is 2 for vimwiki
vim.cmd [[let g:vimwiki_conceallevel = 0]]

-- Dashboard
vim.cmd [[let g:dashboard_default_executive='telescope']]
-- vim.cmd [[let g:dashboard_preview_command='fortune']]

-- vim.cmd [[set foldmethod=expr]]
-- vim.cmd [[set foldexpr=nvim_treesitter#fold_expr()]]

-- vim.cmd [[set foldenable]]
-- vim.cmd [[set foldlevelstart=10]]
-- vim.cmd [[set foldnestmax=10]]
-- vim.cmd [[set foldmethod=syntax]]
-- vim.cmd [[nnoremap <space> za]]


-- For vim-table-mode
-- vim.cmd [[let g:table_mode_header_fillchar='=']]
-- vim.cmd [[let g:table_mode_corner_corner='+']]


vim.cmd [[set foldtext=getline(v:foldstart+1)]]
vim.cmd [[set foldopen-=block]]
-- vim.cmd [[autocmd FileType python setlocal foldenable foldmethod=syntax]]


