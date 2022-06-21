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

" Changing from insert to normal mode
imap jj <Esc>

" Disabling arrow keys in normal mode to learn vim shortcuts
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Copying text to the global keyboard
vnoremap <silent> <C-c> :w !xclip -selection clipboard<CR>

" Comment line
nnoremap <C-_> :Commentary<CR>
vnoremap <C-_> :Commentary<CR>

" Clear screen on exit
au VimLeave * :!clear

" COC settings
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<Tab>" :
    \ coc#refresh()
inoremap <silent><expr> <S-Tab>
    \ pumvisible() ? "\<C-p>" :
    \ <SID>check_back_space() ? "\<C-d>" :
    \ coc#refresh()

" Plugins
call plug#begin()

Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'catppuccin/vim', {'as': 'catppuccin'}
Plug 'tpope/vim-commentary'

call plug#end()

" Use true colors
if exists('+termguicolors')
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" Colorscheme 
colorscheme catppuccin_frappe
set background=dark
hi Normal guibg=NONE ctermbg=NONE

" Lightline
set laststatus=2
set noshowmode
let g:lightline = { 'colorscheme': 'darcula' }
