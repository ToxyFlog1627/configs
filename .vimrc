" Search
set incsearch

" Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Syntax checking
syntax on

" Line numeration
set number relativenumber

" Other
set fileformat=unix
set nocompatible
set noswapfile

" Multi-tab shortcuts
nnoremap <silent> <C-t> :tabnew<CR>
nnoremap <silent> <C-h> :tabp<CR>
nnoremap <silent> <C-l> :tabn<CR>

" Changing from insert to normal mode by 'jj'
imap jj <Esc>

" Disabling arrow keys in normal mode to learn vim shortcuts
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Copying text to the global keyboard
vnoremap <silent> <C-c> :w !xclip -selection clipboard<CR>

" Shift-tab
inoremap <S-Tab> <C-d>

" Clear screen on exit
au VimLeave * :!clear

" Plugins
call plug#begin()

Plug 'valsorym/scrooloose-nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ap/vim-css-color'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'Everblush/everblush.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'catppuccin/vim', {'as': 'catppuccin'}

call plug#end()

" Use true colors
if exists('+termguicolors')
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" Colorscheme 
colorscheme catppuccin_frappe "everblush
set background=dark
hi Normal guibg=NONE ctermbg=NONE

" Lightline
set laststatus=2
set noshowmode
let g:lightline = { 'colorscheme': 'darcula' }
