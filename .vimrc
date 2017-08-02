" .vimrc V3.141_OOOQConfig

" enable bold code in editor
let g:enable_bold_font = 1

" set color scheme from defaults
colorscheme evening

" default window bigger
set lines=45 columns=100

" enable backspace usual behaviour
set backspace=indent,eol,start

" show syntax highlighting
syntax on
filetype plugin indent on

" font size set to 13px
if has('gui_running')
set guifont=Monospace\ 13
endif

" indents
set smarttab
set autoindent      " autoindent always on
set shiftwidth=4    " number of spaces to use for auto-indent
set tabstop=4       " a tab is 4-spaces width
set softtapstop=4   " <bs> pretend a <tab> is removed, even if not
set copyindent      " copy the previous indentation on autoindent

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

" saves file backups with "filename-date.vimbackup"
set directory=~/vimTemp,.
set backupdir=~/vimTemp,.
set backup
set writebackup
au BufWritePre * let &bex = '-' . strftime("%Y%m%d-%H%M%S") . '.vimbackup'

" normal cursor movement
nnoremap j gj
nnoremap k gk

" load the buffer into chrome
nmap, c :!open -a Google\ Chrome<cr>

" general oneliners
set nocompatible			" don't need to be compatible with old vim
set nu						" show line numbers
set showmode      " always show what mode you're on
set nowrap        " don't wrap lines
set showmatch				" show bracket matches
set ignorecase				" ignore case in search
set hlsearch				" highlight all search matches
set cursorline				" highlight current line
set smartcase				" pay attention to case when caps are used
set incsearch				" show search results as I type
set ttimeoutlen=100			" decrease timeout for faster insert with 'O'
set visualbell    "don't beep
set noerrorbells	" don't beep
set autowrite     " save on buffer switch
set ruler					" show row and column in footer
set scrolloff=2				" minimum lines above/below cursor
set laststatus=2			" always show status bar
set clipboard=unnamed		" use the system clipboard
set wildmenu				" enable bash style tab completion
set mouse=a					" enable full mouse support
set wildmode=list:longest,full
runtime macros/matchit.vim	" use % to jump between start/end of methods
