" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'pangloss/vim-javascript'
Plug 'crusoexia/vim-javascript-lib'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kien/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

set termguicolors                         " iterm2 color
syntax on
colorscheme sublimemonokai

set number                                " numbers to the left
set expandtab ts=4 sw=4 ai                " tab spaces
set cursorline                            " highlights current line and number
set spelllang=en                          " spell check

" test
set smarttab
set copyindent
set preserveindent

" NERDTREE 
autocmd vimenter * NERDTree               " Autoload NERDTREE with vim
autocmd VimEnter * wincmd p               " Curser start on file
map <C-n> :NERDTreeToggle<CR>             " Map NERDTREE to ctr
let NERDTreeShowHidden=1.                 " Show hidden files in NERDTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Close NERDTREE when the last editor closes
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" load NERDTREE even if there isn't a file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
