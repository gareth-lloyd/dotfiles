" Vundle set up:
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'

" My Bundles here:
"
" original repos on github
Plugin 'vim-syntastic/syntastic.git'
Plugin 'tpope/vim-fugitive'
" Plugin 'tmhedberg/SimpylFold'


" non github repos
"Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
call vundle#end()            " required
filetype plugin indent on    " required




" Enable syntax highlighting
syntax enable
" Use indent level from previous line
set autoindent
" As above, but recognises code syntax to do it more intelligently
"set smartindent
"set cindent
" line numbering on by default
set number
" toggle line numbering
nnoremap <F3> :set nonumber!<CR>
" toggle paste mode
set pastetoggle=<F2>
" Replace tabs with spaces
set expandtab
" A tab shows as 4 columns wide
set tabstop=4
" How many spaces to indent text with (using << and >>)
set shiftwidth=4
" How many columns to insert when I press TAB
set softtabstop=4
" Highlight matching brackets
set showmatch
" Show line and column in status bar
set ruler
" Search as you type
set incsearch
" Don't highlight search results
"set nohls
" Case insensitive searches
set ignorecase
" Case sensitive searches when uppercase characters are used
set smartcase
" Scroll before I reach the window edge
set scrolloff=2
" Only use one space when joining lines
set nojoinspaces
" Up the undo / redo limit
set history=1000
" Show options during tab completion
set wildmenu

" Set a colour scheme
colorscheme zellner

set swapfile " make swap files
set directory=.,~/.vim/tmp " location of swap files

" Special options for gvim (instead of in .gvimrc)
let s:uname = system("echo -n \"$(uname)\"")
if has("gui_running")
    map <UP> i
    " Dark colour scheme for gvim
    "colorscheme desert
    colorscheme molokai
    " Make the window a bit taller
    set columns=80
    set lines=45
    " Kill toolbar
    set guioptions-=T
    " Add a menu option for reloading the vimrc
    menu File.Reload\ Configuration :source ~/.vimrc<CR>:filetype detect<CR>
    " Set a pretty font
    if s:uname == "Darwin"
        set gfn=Menlo\ Regular:h12
    else
        set guifont=Inconsolata\ 12
    endif
endif

let mapleader=','

" Make j and down keys move down one row even when lines are wrapped
nnoremap j gj
nnoremap <DOWN> gj
" Make k and up keys move up one row even when lines are wrapped
nnoremap k gk
nnoremap <UP> gk
" Make down key move down one row in insert mode even when lines are wrapped
inoremap <DOWN> <C-O>gj
" Make up key move up one row in insert mode even when lines are wrapped
inoremap <UP> <C-O>gk

" switch from insert mode with various character combos
inoremap jj <ESC>
inoremap kk <ESC>
imap ii <Esc>


" Make Y yank rest of line, like D and C
nnoremap Y y$

" Write files with sudo if opened without priviliedges
cmap w!! w !sudo tee % >/dev/null

" Switch tabs easily
if s:uname == "Darwin"
    nnoremap <D-S-left> gT
    nnoremap <D-S-right> gt
else
    nnoremap <A-S-left> gT
    nnoremap <A-S-right> gt
endif

" Shortcuts for enabling / disabling search highlighting
nmap ,hl :set hls<CR>
nmap ,nhl :set nohls<CR>

" Use alt + {j,k} for moving lines up and down
if s:uname == "Darwin"
    nnoremap <D-j> :m+<CR>==
    nnoremap <D-k> :m-2<CR>==
    "inoremap <M-j> <Esc>:m+<CR>==gi
    "inoremap <M-k> <Esc>:m-2<CR>==gi
    vnoremap <D-j> :m'>+<CR>gv=gv
    vnoremap <D-k> :m-2<CR>gv=gv
else
    nnoremap <A-j> :m+<CR>==
    nnoremap <A-k> :m-2<CR>==
    "inoremap <A-j> <Esc>:m+<CR>==gi
    "inoremap <A-k> <Esc>:m-2<CR>==gi
    vnoremap <A-j> :m'>+<CR>gv=gv
    vnoremap <A-k> :m-2<CR>gv=gv
endif

" Use the same symbols as TextMate for tabstops and EOLs
set list
set listchars=tab:▸\ ,trail:•

" Remove trailing whitespace
command CleanWhitespace %s/\s\+$//

" Enable filetype settings (inc. indentation), files in .vim/ftplugin are read
filetype plugin indent on

" JSON support
au! BufRead,BufNewFile *.json setfiletype json

if has("autocmd")
    " Tell ruby files to use two spaces for indentation
    autocmd FileType ruby setlocal softtabstop=2 shiftwidth=2 tabstop=4
    " Tell json files to use two spaces for indentation
    autocmd FileType json setlocal softtabstop=2 shiftwidth=2 tabstop=4
    " Tell javascript files to use two spaces for indentation
    autocmd FileType javascript setlocal softtabstop=2 shiftwidth=2 tabstop=4
    autocmd FileType html setlocal softtabstop=2 shiftwidth=2 tabstop=2
    autocmd FileType htmldjango setlocal softtabstop=2 shiftwidth=2 tabstop=2
    autocmd FileType css setlocal softtabstop=2 shiftwidth=2 tabstop=2
    " Tell coffeescript files to use two spaces for indentation
    autocmd FileType coffee setlocal softtabstop=2 shiftwidth=2 tabstop=4
    " Tell scala files to use two spaces for indentation
    autocmd FileType scala setlocal softtabstop=2 shiftwidth=2 tabstop=4
    " Makefiles use tabs only
    autocmd FileType make setlocal noexpandtab
    " Some types of files should wrap to 79 characters
    autocmd FileType tex setlocal textwidth=79
    autocmd FileType plaintex setlocal textwidth=79
    autocmd FileType latex setlocal textwidth=79
    autocmd FileType rst setlocal textwidth=79
    autocmd FileType txt setlocal textwidth=80
    " Enable spell checking for latex and rst
    autocmd FileType tex setlocal spell spelllang=en_gb
    autocmd FileType plaintex setlocal spell spelllang=en_gb
    autocmd FileType latex setlocal spell spelllang=en_gb
    autocmd FileType rst setlocal spell spelllang=en_gb
    " Use pdflatex for compiling latex files
    autocmd FileType tex setlocal makeprg=pdflatex\ %
    " Don't do things like indent lines following lines that start with 'for'
    autocmd FileType tex setlocal nosmartindent
    autocmd FileType plaintex setlocal nosmartindent
    autocmd FileType latex setlocal nosmartindent
    " Enable omnicomplete for Python
    "autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
endif

augroup mkd
    " Enable Markdown support
    autocmd BufRead *.mkd set ai formatoptions=tcroqn2 comments=n:&gt;
augroup end

" Source a global configuration file if available
if filereadable(expand("$HOME/.vimrc.local"))
    source $HOME/.vimrc.local
endif

" change pyflakes highlight colour
highlight SpellBad term=standout ctermfg=4

set backspace=indent,eol,start

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=col:\ %c,

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_python_checkers = ['pyflakes', 'pep8', 'flake8']
let g:syntastic_javascript_checkers = ['eslint', 'jshint']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
