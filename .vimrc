" .vimrc V3.14
set encoding=utf-8

" enable bold code in editor
let g:enable_bold_font = 1

" set dark background and color scheme
" https://github.com/hzchirs/vim-material
" place it in vim80/colors
colorscheme vim-material

" show syntax highlighting
syntax on
filetype plugin indent on

" custom font
if has('gui_running')
set guifont=Consolas:h13:cANSI 	" set font size 13px
endif

" set auto indent, smarttab at new line, tabs = 4 spaces
set autoindent
set smarttab
set shiftwidth=4
set tabstop=4

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

" saves file backups in USER/vimTemp (must be manually created)
set backupdir=~/vimTemp,.
set directory=~/vimTemp,.

set nocompatible			" don't need to be compatible with old vim
set nu						" show line numbers
set showmatch				" show bracket matches
set ignorecase				" ignore case in search
set hlsearch				" highlight all search matches
set cursorline				" highlight current line
set smartcase				" pay attention to case when caps are used
set incsearch				" show search results as I type
set ttimeoutlen=100			" decrease timeout for faster insert with 'O'
set vb						" enable visual bell (disable audio bell)
set ruler					" show row and column in footer
set scrolloff=2				" minimum lines above/below cursor
set laststatus=2			" always show status bar
set clipboard=unnamed		" use the system clipboard
set wildmenu				" enable bash style tab completion
set wildmode=list:longest,full
runtime macros/matchit.vim	" use % to jump between start/end of methods

