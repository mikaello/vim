" install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
  \| endif

call plug#begin('~/.vim/plugged')

Plug 'ntpeters/vim-better-whitespace'

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

let g:coc_global_extensions += ['coc-prettier']

call plug#end()

filetype plugin indent on

" COC shortcuts
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)


" force vim to rescan the entire buffer when highlighting
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" different cursor in edit and normal mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"


set matchpairs+=<:> " use % to jump between pairs

" Set hybrid relative and absolute line numbers
set number
"set relativenumber

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

set hidden
set nobackup
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set title
set visualbell
set noerrorbells
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
"set nowrap        " don't wrap lines
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set splitbelow    " spawn horizontal splits below instead of above
set splitright    " spawn vertical splits to the right instead of left
"set colorcolumn=100 "Show vertical line at 100 chars
set noswapfile    " Turn off swap file


" Inspiration from here: https://gist.github.com/simonista/8703722
" Inspiration: https://github.com/kimpers/dotfiles/blob/master/.vim/.vimrc
