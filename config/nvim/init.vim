:set number
:syntax on
:set tabstop=4
:set autoindent
:set smarttab
:set softtabstop=4
:set mouse=a
:set shiftwidth=4


call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/mattn/emmet-vim'
Plug 'https://github.com/plasticboy/vim-markdown'
Plug 'https://github.com/tc50cal/vim-terminal'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal

call plug#end()
:set completeopt=preview " For No Previews

:colorscheme jellybeans
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

