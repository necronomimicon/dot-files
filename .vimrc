"To create your vimrc, start up Vim and do one of the following:
":e $HOME/.vimrc  " on Unix, Mac or OS/2
":e $HOME/_vimrc  " on Windows
":e s:.vimrc      " on Amiga
"Insert the settings you want, and save the file.
"Note that exisitence of this file will disable the compatible option
"https://stackoverflow.com/questions/10921441/where-is-my-vimrc-file

" START PERSONAL SPECIFIC START """"""""""""""""""""""""
" inverts up and down
nnoremap j k
nnoremap k j

" inverts insert a & i
nnoremap a i
nnoremap i a

" inverts r key modes
nnoremap r R
nnoremap R r

" cursors doesn't print letters
set nocompatible
" END PERSONAL SPECIFIC END """"""""""""""""""""""""

" enable bold code in editor
let g:enable_bold_font = 1

" set dark color scheme from defaults
colorscheme desert

" default window bigger
set lines=96 columns=164

" enable backspace usual behaviour
set backspace=indent,eol,start

" show syntax highlighting
syntax on
filetype plugin indent on

" fonts set
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

" indents
set smarttab
set autoindent                  " autoindent always on
set shiftwidth=4                " number of spaces to use for auto-indent
set tabstop=2                   " a tab is 2-spaces width
set softtabstop=4               " <bs> pretend a <tab> is removed, even if not
set copyindent                  " copy the previous indentation on autoindent

" highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" mark the 80th column
if exists('+colorcolumn')
  set colorcolumn=80
endif

" unmap F1 help
nmap <F1> <nop>
imap <F1> <nop>

" highlight the status bar when in insert mode
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
  au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
endif

" any time you save, a .vimbckp is created with the file on its previous state "filename-date.vimbckp"
set directory=~/vimTemp,.
set backupdir=~/vimTemp,.
set backup
set writebackup
au BufWritePre * let &bex = '-' . strftime("%Y%m%d-%H%M%S") . '.vimbckp'

" load the buffer into chrome
nmap, c :!open -a Google\ Chrome<cr>

" preserve pageUp & pageDown beha. & cursor position
map <silent> <PageUp> 9001<C-U>
map <silent> <PageDown> 9001<C-D>
imap <silent> <PageUp> <C-O>9001<C-U>
imap <silent> <PageDown> <C-O>9001<C-D>

" START GENERAL ONELINERS START """"""""""""""""""""""""
set encoding=utf-8
set nocompatible                " don't need to be compatible with old vim
set nu                          " show line numbers
set showmatch                   " show bracket matches
set laststatus=2                " show status bar always
set ruler                       " show row and column in footer
set showmode                    " show what mode you're on always
set scrolloff=2                 " minimum lines to show above/below cursor
" set nowrap                    " don't wrap lines (but I prefer to)

set cursorline                  " highlight current line
set hlsearch                    " highlight all search matches
set ignorecase                  " ignore case in search
set incsearch                   " show search results as I type
set smartcase                   " pay attention to case when caps are used

set ttimeoutlen=100             " decrease timeout for faster insert with 'O'
set visualbell                  " don't beep
set noerrorbells                " don't beep
set autowrite                   " save on buffer switch

set clipboard=unnamed           " use the system clipboard
set wildmenu                    " enable bash style tab completion
set mouse=a                     " enable full mouse support
set wildmode=list:longest,full
runtime macros/matchit.vim      " use % to jump between start/end of methods
" END GENERAL ONELINERS END """"""""""""""""""""""""
