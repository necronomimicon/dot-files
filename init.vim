" Setup NeoBundle --------------------{{{
" If vundle is not installed, do it first

 let bundleExists = 1
 if (!isdirectory(expand("$HOME/.nvim/bundle/neobundle.vim")))
  call system(expand("mkdir -p $HOME/.nvim/bundle"))
  call system(expand("git clone https://github.com/Shougo/neobundle.vim ~/.nvim/bundle/neobundle.vim"))
  let bundleExists = 0
 endif

 if 0 | endif

 if has('vim_starting')
  if &compatible
   " Be iMproved
   set nocompatible
  endif

" Required:
  set runtimepath+=~/.nvim/bundle/neobundle.vim/
  set runtimepath+=~/.nvim/bundle/bolt.vim/
 endif

" Required
 call neobundle#begin(expand('~/.nvim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

" syntax
 NeoBundle 'vim-css3-syntax'
 NeoBundle 'vim-scripts/SyntaxComplete'

" colorscheme & syntax highlighting
 NeoBundle 'mhartington/oceanic-next'
 NeoBundle 'Yggdroot/indentLine'
 NeoBundle 'Raimondi/delimitMate'
 NeoBundle 'valloric/MatchTagAlways'

" git helpers
 NeoBundle 'tpope/vim-fugitive'
 NeoBundle 'airblade/vim-gitgutter'
 NeoBundle 'Xuyuanp/nerdtree-git-plugin'

" untils
 NeoBundle 'benekastah/neomake'
 NeoBundle 'editorconfig/editorconfig-vim'
 NeoBundle 'scrooloose/nerdtree'
 NeoBundle 'bling/vim-airline'
 NeoBundle 'tpope/vim-surround'
 NeoBundle 'mattn/emmet-vim'

 NeoBundle 'Shougo/deoplete.nvim'
 NeoBundle 'Shougo/neco-vim'
 NeoBundle 'Shougo/neoinclude.nvim'

 NeoBundle 'Shougo/neosnippet.nvim'
 NeoBundle 'Shougo/neosnippet-snippets'
 NeoBundle 'honza/vim-snippets'

" because fuck it, icons are awesome
 NeoBundle 'ryanoasis/vim-devicons'
 NeoBundle 'terryma/vim-multiple-cursors'
 call neobundle#end()

" Required:
  filetype plugin indent on
  NeoBundleCheck
  if bundleExists == 0
   echo "installing bundles, ignore errors"
  endif

" }}}

" System Settings --------------------{{{
" Neovim Settings
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set clipboard+=unnamedplus

" currently needed for neovim paste issue
  set pastetoggle=<f6>

" let airline tell me my status
  set noshowmode
  set noswapfile
  filetype on
  set tabstop=2 shiftwidth=2 expandtab
  set conceallevel=0

" block select not limited by shortest line
  set virtualedit=
  set wildmenu
  set laststatus=2

" set colorcolumn=100
  set wrap linebreak nolist
  set wildmode=full

" remember cursor position between vim sessions
  autocmd BufReadPost *
    \ if line ("'\'") > 0 && line ("'\'") <= line("$") |
    \  exe "normal! g'\"" |
    \ endif
    " center buffer around cursor when opening files
  autocmd BufRead * normal zz
"}}}

" System mappings --------------------{{{
" no need for ex mode
  nnoremap Q <nop>

