" PERSO
syntax on
let g:netrw_liststyle=3
set number
set wildmenu 
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,*app/cache/**,*app/logs/**,*/zend/**,*/bootstrap.*.*
set autoindent " Always set autoindenting on
set copyindent " copy the previous indentation on autoindenting
set nobackup " Don't make a backup before overwriting a file
set nowritebackup " And again.
set noswapfile " Use an SCM instead of swap files
set expandtab " no real tabs please!
set shiftwidth=4 " auto-indent amount when using cindent, >>, << and stuff
set softtabstop=4 " when hitting tab or backspace, how many spaces should a
set tabstop=4 " real tabs should be 2
set encoding=utf-8
set scrolloff=5 " Keep x line for scope while scrolling
set sidescrolloff=5
set wrap " long lines wrap and continue to the next line
set colorcolumn=120
" Toggle line numbers and fold column for easy copying:
nnoremap <C-l> :set nonumber!<CR>:set foldcolumn=0<CR>

" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'evidens/vim-twig'
Plugin 'tpope/vim-fugitive'
Plugin 'godlygeek/tabular'

call vundle#end()            " required
filetype plugin indent on    " required

"map <C-n> :NERDTreeToggle<CR>

"Highlight unwanted spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufWinLeave * call clearmatches()

" Theme setup
"============
let &t_Co=256 " force the 256-color mode
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" Syntastic
let g:syntastic_auto_loc_list = 0 " auto open/close the errors list
let g:syntastic_quiet_messages = {'level': 'warnings'} " don't want warnings to be diplayed

"Sudo to write
command W w !sudo tee % > /dev/null

" edit vimrc in a new tab
nnoremap <leader>ev :tabnew $MYVIMRC<CR>

" Trim trailing spaces
map <leader>t :%s/\s\+$<CR>

" vim-airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'

" ctrlP
let g:ctrlp_extensions = ['mixed']
let g:ctrlp_clear_cache_on_exit = 0
nnoremap <c-p> :CtrlPMixed<cr>

" tagbar
let g:tagbar_left = 1 " display the tagbar on the left side
set updatetime=500 " show tags' prototype after 500 milliseconds
let g:tagbar_width = 25 " width in characters of the tagbar
let g:tagbar_autoshowtag = 1 " always show the current tag in the tagbar
let g:tagbar_autofocus = 1 " the cursor will move to the Tagbar window when
nnoremap <silent> <F10> :TagbarToggle<CR>
nmap <F8> :TagbarToggle<CR>
" http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
" F2 = toggle paste mode
nnoremap <F2> :set invpaste paste?<Enter>
imap <F2> <C-O><F2>
set pastetoggle=<F2>
