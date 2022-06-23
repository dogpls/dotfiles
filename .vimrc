"
" Maintainer: Gomez
" Last change: 2022 June
"
"

" MAIN ---------------------------------------------------------------- {{{

    " Main
"Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on
   
" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

"Ensures that each line is not longer than 100 columns
set textwidth=100

"Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Word wrapping lines.
set wrap

" Do not break in the middle of a word.
set linebreak

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

set spell
set ruler
set undolevels=1000

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu
    
" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Vim hardcodes background color erase even if the terminfo file does
" not contain bce (not to mention that libvte based terminals
" incorrectly contain bce in their terminfo files). This causes
" incorrect background rendering when using a color theme with a
" background color.
    let &t_ut=''

 " General colors
    if has('gui_running') || has('nvim') 
        hi Normal 		guifg=#f6f3e8 guibg=#242424 
    else
     
" Set the terminal default background and foreground colors, thereby
" improving performance by not needing to set these colors on empty cells.
    hi Normal guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
    let &t_ti = &t_ti . "\033]10;#f6f3e8\007\033]11;#242424\007"
    let &t_te = &t_te . "\033]110\007\033]111\007"
    endif

    " }}}


" PLUGINS ---------------------------------------------------------------- {{{

    " Plugins
    call plug#begin("~/.vim/plugged")                                                                 

    " File System Explorer
    Plug 'junegunn/fzf', {'do': { -> fzf#install() } }       
    Plug 'junegunn/fzf.vim'
    Plug 'francoiscabrol/ranger.vim'

    " Tim Pope
    "Plug 'tpope/vim-surround'
    "Plug 'tpope/vim-fugitive'
    "Plug 'tpope/vim-repeat'

    "Open-Browser.vim - Open URL with Vim.
    Plug 'tyru/open-browser.vim'
    
    " Linting, ALE (Asynchronous Lint Engine) is a plugin providing linting (syntax checking and semantic errors)
    Plug 'w0rp/ale'

    " Statusline
    Plug 'vim-airline/vim-airline'                                                                        
    Plug 'vim-airline/vim-airline-themes'                                                                 

    " Conquer of Completion Make your Vim as smart as VSCode.
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Supertab is a vim plugin which allows you to use <Tab> for all your insert completion needs (:help ins-completion).
    Plug 'ervandew/supertab'
    " Emmet 
    Plug 'mattn/emmet-vim'
    " Prettier / post install (yarn install | npm install) then load plugin only for editing supported files
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
    " Auto Pairs Brackets
    Plug 'jiangmiao/auto-pairs'
    " Vim Icons
    " Plug 'ryanoasis/vim-devicons'
    
    """"""""""
    " Themes "
    """"""""""
    Plug 'rafi/awesome-vim-colorschemes'
    Plug 'flazz/vim-colorschemes'
    Plug 'chriskempson/base16-vim'
    " Statusline
    Plug 'vim-airline/vim-airline' 
    Plug 'vim-airline/vim-airline-themes'                                                                 
    call plug#end()
    " Set the background tone.
    set background=dark
    " enable true colors support
    set termguicolors
    " Set the color scheme.                                          
    colorscheme base16-gruvbox-dark-soft

    " }}}


" MAPPINGS --------------------------------------------------------------- {{{

" Mappings code goes here.

" NerdTree shortcuts
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{


" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" If the current file type is HTML, set indentation to 2 spaces.
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab
       
" If Vim version is equal to or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" You can split a window into sections by typing `:split` or `:vsplit`.
" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END

" If GUI version of Vim is running set these options.
if has('gui_running')

    " Set a custom font you have installed on your computer.
    " Syntax: set guifont=<font_name>\ <font_weight>\ <size>
    set guifont=Monoid\ Regular\ 14

    " Display more of the file by default.
    " Hide the toolbar.
    set guioptions-=T

    " Hide the the left-side scroll bar.
    set guioptions-=L

    " Hide the the right-side scroll bar.
    set guioptions-=r

    " Hide the the menu bar.
    set guioptions-=m

    " Hide the the bottom scroll bar.
    set guioptions-=b

    " Map the F4 key to toggle the menu, toolbar, and scroll bar.
    " <Bar> is the pipe character.
    " <CR> is the enter key.
    nnoremap <F4> :if &guioptions=~#'mTr'<Bar>
        \set guioptions-=mTr<Bar>
        \else<Bar>
        \set guioptions+=mTr<Bar>
        \endif<CR>

endif

" }}}


" STATUS LINE ------------------------------------------------------------ {{{

" Status bar

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2
" }}}
