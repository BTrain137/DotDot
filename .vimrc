" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'crusoexia/vim-monokai'
Plug 'pangloss/vim-javascript'
Plug 'crusoexia/vim-javascript-lib'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

set termguicolors             " iterm2 color
syntax on
colorscheme sublimemonokai

set number                    " numbers to the left
set expandtab ts=4 sw=4 ai    " tab spaces
set cursorline                " highlights current line and number
set spelllang=en              " spell check

" test
set smarttab
set copyindent
set preserveindent

" NERDTREE 
autocmd vimenter * NERDTree   " autoload NERDTREE with vim
autocmd VimEnter * wincmd p   " curser start on file
map <C-n> :NERDTreeToggle<CR> " map NERDTREE to ctr
let NERDTreeShowHidden=1

" Close NERDTREE when the last editor closes
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" load NERDTREE even if there isn't a file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:monokai_term_italic = 1      " might not need this
let g:monokai_gui_italic = 1       " might not need this
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
