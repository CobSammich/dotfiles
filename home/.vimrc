"""""""""""
" Plugins "
"""""""""""
call plug#begin('~/.vim/plugged')

" i3 config syntax highlighting
Plug 'mboughaba/i3config.vim'
" Hex code highlighting background color
Plug 'chrisbra/colorizer'

Plug 'vimwiki/vimwiki'

Plug 'junegunn/goyo.vim'

" This is pissing me off -- because it does this even when there are characters in front of it
"Plug 'jiangmiao/auto-pairs'

Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'ryanoasis/vim-devicons'

" Colorschemes
"Plug 'morhetz/gruvbox'
Plug 'jaredgorski/spacecamp'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" LSP
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

call plug#end()

""" vim-lsp settings
" Show diagnostics of file
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_sign_enabled = 0
let g:lsp_document_code_action_signs_enabled = 0 " Remove the ^A on left of line numbers

" Show current line error in status
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_echo_delay = 200
"let g:lsp_diagnostics_float_cursor = 1
"let g:lsp_diagnostics_float_delay = 200

" open function preview in new window/split. Floating window is buggy
let g:lsp_hover_ui='preview'
" Define symbols for errors/warnings/hints
let g:lsp_diagnostics_signs_error = {'text': '✘'}
let g:lsp_diagnostics_signs_warning = {'text': '⚠'}
let g:lsp_diagnostics_signs_hint = {'text': '‼'}

if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> ge <plug>(lsp-document-diagnostics)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    "autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

"""""""""""""""""""
" Plugin Settings "
"""""""""""""""""""
" Usage of markdown files with vimwiki and ability to compile them to html using vimwiki_markdown
let g:vimwiki_list = [{
	\ 'path': '~/vimwiki',
	\ 'template_path': '~/vimwiki/templates/',
	\ 'template_default': 'default',
    \ 'template_ext': '.html',
	\ 'syntax': 'markdown',
	\ 'ext': '.md',
	\ 'path_html': '~/vimwiki/site_html/',
    \ 'custom_wiki2html': 'vimwiki_markdown'}]


" '$HOME/Scripts/vimwiki2html.sh'
let g:vimwiki_hl_headers = 1
" Don't allow all markdown files to be vimwiki files
let g:vimwiki_global_ext = 0
" Use code syntax highlighitng within vimwiki pages.
let g:markdown_fenced_languages = ['python', 'cpp', 'c', 'rust', 'vim',
                                 \ 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript',
                                 \ 'ruby', 'sass', 'xml', 'html']
" Disable hiding tick marks for code blocks -- default is 2 for vimwiki
let g:vimwiki_conceallevel = 0

au FileType vimwiki set syntax=pandoc

" Disable Coc in markdown files
autocmd FileType markdown let b:coc_suggest_disable = 1
" Coc only show completion list on C-p

" Do auto pairs on markdown italics/bold identifiers
"autocmd FileType markdown let g:AutoPairs['*']='*'
"autocmd FileType markdown let g:AutoPairs['**']='**'

" Open NERDTree if no file arguments are given
autocmd VimEnter * if !argc() | NERDTree | endif
let NERDTreeShowHidden=1

"""""""""""""""""""""""""
" Basic Editor Settings "
"""""""""""""""""""""""""
syntax on
set nocompatible
filetype plugin on
set encoding=UTF-8
"set guifont=TerminessTTF\ Nerd\ Font\ Medium\ 11
"set guifont=Terminess\ \(TTF\)\ Nerd\ Font\ Complete\ Mono\ 11

" Colorscheme
colorscheme spacecamp

" Highlight line that cursor is on
set cursorline


" Setting tab length to 4
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

" Ignore case sensitive string searching
set ignorecase

" Autoindent on new line
set autoindent

" For Line Numbers
set number "relativenumber
highlight LineNr ctermfg=7 ctermbg=0

" Stay on the same column when navigating lines
set virtualedit=all

" set the column number for wrapping on `gq` call
set textwidth=100
set formatoptions=crq
" For tex and md files, allow line wrapping
au BufRead,BufNewFile *.tex,*.md set fo+=t
au BufNewFile,BufReadPost *.md set filetype=markdown

"set formatoptions+=q
"set formatoptions+=a " auto formatt paragraphs
"set formatoptions+=w " 'paragraphs' are identified by whitespace at the end of the line.
"if &filetype ==# 'tex' || &filetype ==# 'markdown'
    "set fo+=t
"endif

" Remove all trailing whitespace on :w
autocmd BufWritePre * call TrimWhitespace()

" Store location on save and read
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Mouse usage
set mouse=nv

" get rid of annoying visual bell in git bash
set t_vb=

" Places all .swp files in a temporary directory instead of flooding my working directory
set directory^=$HOME/.vim/tmp//
set noswapfile " Or this denies them entirely?

set nosmartindent
set nowrap
set smartcase
set scrolloff=5

" Makes a color column at column#
"set colorcolumn=80
"highlight ColorColumn ctermbg=7 guibg=lightgrey

""""""""""""
" Mappings "
""""""""""""
" Easy split navigation -- no need for Ctrl-W
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Autocomplete Scrolling with j/k
"inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
"inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" when making paragraph fit horizontally go up a line and to the end. makes more sense than going down two lines.
nnoremap gqj gqjk$
" keeping it centered
nnoremap n nzzzv
nnoremap N Nzzzv

" Put ` around a word
nnoremap ` ciw``<ESC>hp

" File navigation with NERDTree
map <F2> :NERDTreeToggle<CR>
" open netrw on F2 and F3
"map <F2> :Vexplore<CR>
"map <F3> :Hexplore<CR>
" netrw settings
let g:netrw_browse_split = 0
"let g:netrw_winsize = 25
let g:netrw_linestyle = 3
let g:netrw_banner = 0

" removes all trailing whitespace at the end of a line - I call this function on file save
function! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

"""""""""""""
" Functions "
"""""""""""""

function! RunRust()
    let s:current_file = expand("%")
    echo s:current_file

    setlocal nobuflisted
    setlocal buftype=nofile
    setlocal bufhidden=wipe
    noswapfile
    setlocal nonumber

    if &filetype == 'rust'
        new | 0read !cargo run
    elseif &filetype == 'python'
        " This works when there are no command line args to be given
"        let cmdline_call = "latexmk -pdf -p -aux-directory=.tex_logs -interaction=scrollmode " . filename
"        "execute 'botright new | $read !' . cmdline_call
        silent execute ".!python " . shellescape(s:current_file, 1)
        "new | 0read !python %
    endif
    setlocal readonly
    setlocal nomodifiable
endfun

function! SaveAndExecutePython()
    " SOURCE [reusable window]: https://github.com/fatih/vim-go/blob/master/autoload/go/ui.vim
    " save and reload current file
    silent execute "update | edit"

    " get file path of current file
    let s:current_buffer_file_path = expand("%")
    " Name and filetype for buffer
    let s:output_buffer_name = "Code Output"
    let s:output_buffer_filetype = "output"
    let s:current_filetype = &filetype

    " reuse existing buffer window if it exists otherwise create a new one
    if !exists("s:buf_nr") || !bufexists(s:buf_nr)
        silent execute 'botright new ' . s:output_buffer_name
        let s:buf_nr = bufnr('%')
    elseif bufwinnr(s:buf_nr) == -1
        silent execute 'botright new'
        silent execute s:buf_nr . 'buffer'
    elseif bufwinnr(s:buf_nr) != bufwinnr('%')
        silent execute bufwinnr(s:buf_nr) . 'wincmd w'
    endif

    silent execute "setlocal filetype=" . s:output_buffer_filetype
    setlocal bufhidden=delete
    setlocal buftype=nofile
    setlocal noswapfile
    setlocal nobuflisted
    setlocal winfixheight
    setlocal cursorline " make it easy to distinguish
    setlocal nonumber
    setlocal norelativenumber
    setlocal showbreak=""

    " clear the buffer
    setlocal noreadonly
    setlocal modifiable
    %delete _

    " NOTE: Add whatever language support I want here
    " add the console output
    if s:current_filetype == 'rust'
        silent execute ".!cargo run"
    elseif s:current_filetype == 'python'
        silent execute ".!python " . shellescape(s:current_buffer_file_path, 1)
    endif

    " resize window to content length
    " Note: This is annoying because if you print a lot of lines then your code buffer is forced to a height of one line every time you run this function.
    "       However without this line the buffer starts off as a default size and if you resize the buffer then it keeps that custom size after repeated runs of this function.
    "       But if you close the output buffer then it returns to using the default size when its recreated
    "execute 'resize' . line('$')
    execute 'resize 15'

    " make the buffer non modifiable
    setlocal readonly
    setlocal nomodifiable
endfunction


"""""""""""""""
" Status Line "
"""""""""""""""
" statusline
set laststatus=2
" Changes the statusline color when in insert mode
function! InsertStatuslineColor(mode)
    if a:mode == 'i'
        " black on blue
        hi statusline ctermfg=0 ctermbg=4
    elseif a:mode == 'r'
        " black on red
        hi statusline ctermfg=0 ctermbg=1
    else
        " white on black
        hi statusline ctermfg=white ctermbg=15
    endif
endfunction

"au InsertLeave,InsertEnter,BufWritePost   * call ModifiedColor()
au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline ctermfg=white ctermbg=black

" default the statusline when entering Vim
hi statusline ctermfg=white ctermbg=black

" Formats the statusline
set statusline=%F\                            " file name
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%y      "filetype
set statusline+=%h      "help file flag
set statusline+=[%{getbufvar(bufnr('%'),'&mod')?'modified':'saved'}]
"modified flag

set statusline+=%r      "read only flag

set statusline+=\ %=                        " align left
set statusline+=Line:%l/%L[%p%%]            " line X of Y [percent of file]
set statusline+=\ Col:%c                    " current column
set statusline+=\ Buf:%n                    " Buffer number
set statusline+=\ [%{strftime('%H:%M')}]    " Time
"set statusline+=\ [%b][0x%B]\               " ASCII and byte code under cursor

""""""""""""""""
" Python Stuff "
""""""""""""""""
" Easy python debugging trace w/ Ctrl-D
nmap <C-D> oipdb.set_trace()<esc>

"""""""""""""
" C++ Stuff "
"""""""""""""
" c++ disable auto comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

""""""""""""""""""
" Spell Checking "
""""""""""""""""""
" Toggle spell checking with F5
nnoremap <F5> :setlocal spell! spelllang=en_us<CR>
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red

"""""""""""""""""""""""""""""
" Anything Markdown Related "
"""""""""""""""""""""""""""""
" disable error highlighting in markdown
hi link markdownError Normal
autocmd BufNewFile,BufRead,BufEnter *.md, set syntax=markdown
" Wrapping columns for paragraphs etc
autocmd BufNewFile,BufRead,BufEnter *.md,*.tex set tw=100

" detect when in i3 config and provide syntac highlighting
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

"""""""""""""
" Trash Can "
"""""""""""""

" Recompile pdf on .tex file save
"function PDFLatexCompile()
"    " Assuming that the main tex file is main.tex
"    let base = expand('%:r')
"    let outputPDFname = base . ".pdf"
"    silent! execute "!pdflatex -aux-directory .tex_logs % >/dev/null 2>&1 &"
"    silent! execute "!start" outputPDFname | redraw!
"endfunction

" turn markdown files to html -- using markdown_py
"function MarkdownToHtml()
"    " If this isn't a markdown file, don't even bother...
"    if &filetype == 'markdown' || &filetype == 'vimwiki'
"        " filename without the extension
"        let base = expand('%:r')
"        " Filepath of the output html file
"        let fullfilepath = getcwd() . "/" . base . ".html"
"        " necessary to open a file instead of searching the web...
"        " Hacky work around to use "C:/" instead of "/c/" which is necessary
"        " For windows:
"        "let webpagename = "file:///C:/" . join(split(fullfilepath, '/')[1:], "/")
"        " For Linux
"        let webpagename = "file:///" . join(split(fullfilepath, '/'), "/")
"        " Call markdown_py on the file and output to an html
"        silent! execute "!markdown_py" base . ".md > " . base . ".html"
"        " TODO: Check if we are in my windows env or linux, this command below wont work if we are on linux
"        " Now open the file in firefox and redraw the vim window
"        " For Windows
"        " silent! execute "!start firefox" webpagename | redraw!
"        " For Linux
"        silent! execute "!firefox-esr" webpagename | redraw!
"        " TODO would be cool to refocus the mouse on the vim window
"        " automatically... not sure if that is honestly possible
"        1
"    endif
"endfunction
"map <F6> :call MarkdownToHtml()<CR>
"
" Compile latex source and display output pdf
"function! LatexmkCompile()
"    " filetype check
"    if &filetype == 'tex'
"        let filename = expand('%:t:r') . ".tex"
"        echo "Compiling " . filename
"        "let cmdline_call = "latexmk -pdf -p -outdir=.tex_logs -aux-directory=.tex_logs -interaction=scrollmode " . filename
"        let cmdline_call = "latexmk -pdf -p -aux-directory=.tex_logs -interaction=scrollmode " . filename
"        "execute 'botright new | $read !' . cmdline_call
"
"        botright new
"        setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
"        call setline(1, 'Command Line:    ' . cmdline_call)
"        call setline(2,substitute(getline(1),'.','=','g'))
"        " Compile the document
"        execute 'silent !' . cmdline_call | redraw!
"        " Once compilation is done, display any error lines in new buffer
"        silent! execute '$read !grep -A 1 -F "\! " .tex_logs/main.log'
"        silent! execute "!start texworks.exe main.pdf"
"        " Resize the output to be smaller
"        resize 10
"        setlocal nomodifiable
"        1
"    endif
"endfunction
"
"" Map function above to F7
"map <F7> :call LatexmkCompile()<CR>
"
"" don't highlight underscores in filenames
""syn match texInputFile "\\subfile\s*\(\[.*\]\)\={.\{-}}"
"     "\ contains=texStatement,texInputCurlies,texInputFileOpt
"
