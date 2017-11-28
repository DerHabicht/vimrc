" Basic functional settings
set nocompatible

"" Buffer text formatting
set encoding=utf-8
set ffs=unix,dos
set ruler
set formatoptions=t
set textwidth=79
autocmd BufWritePre * :%s/\s\+$//e

""" Folding
set backspace=indent,start
set foldmethod=indent

""" Tab settings
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set nolist
set expandtab

""" Search highligting
set incsearch
set smartcase

""" Web overrides for tab settings
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2

""" Miscellaneous
set autoread
set cm=blowfish2
set ignorecase
set wildmenu
set wrap
colorscheme slate

"" Plugin pre-load settings
""" MiniBufExpl
let g:miniBufExplVSplit = 30
let g:miniBufExplBRSplit = 1

""" Vim Airline
let g:airline#extensions#wordcount#filetypes = get(g:, 'airline#extensions#wordcount#filetypes',
      \ '\vhelp|markdown|rst|org|text|asciidoc|tex|mail|pandoc')

""" Vim Pandoc
let g:pandoc#formatting#mode = "h"
autocmd BufNewFile,BufRead *.m4 set filetype=pandoc

""" Grammarous
let g:grammarous#disabled_rules = {'*': ['EN_QUOTES'],}

""" NERDTree
let NERDTreeMapOpenInTab = '\t'

"" Load Plugins
""" Vundle Setup
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

""" Plugin List
Plugin 'mtth/scratch.vim'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'rhysd/vim-grammarous'
Plugin 'vim-airline/vim-airline'
Plugin 'jreybert/vimagit'
Plugin 'airblade/vim-gitgutter'
Plugin 'mbbill/undotree'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-syntastic/syntastic'
Plugin 'weynhamz/vim-plugin-minibufexpl'
Plugin 'git@github.com:Valloric/YouCompleteMe.git'
Plugin 'tpope/vim-fugitive'
Plugin 'renyard/vim-git-flow-format'

""" Finalize Vundle
call vundle#end()
filetype plugin indent on

" Keybind setup
let mapleader = " "

"" Unmappings
nnoremap s <NOP>
vnoremap s <NOP>

"" Movement reconfiguration
""" Primary movement commands
noremap d h
vnoremap d h
noremap h gj
vnoremap h gj
noremap t gk
vnoremap t gk
noremap n l
vnoremap n l

""" Remap displaced commands
" Remap j, k, and l to the functions previously done by d, n, and t
"  Since these function keys moved around, I came up with new mnemonics:
"   -  'jerk' for delete
"   -  'keep looking' for next search
"   -  'look' for what t used to do (I didn't know a mnemonic for t)
noremap j d
vnoremap j d
noremap k n
vnoremap k n
noremap l t
vnoremap l t
noremap J D
vnoremap J D
noremap K N
vnoremap K N
noremap L T
vnoremap L T

""" Half-page moves
noremap H <C-D>
noremap T <C-U>

""" Line manipulation
"  I use 'Kut line' as the mnemonic for splitting a line
inoremap <C-N> <C-T>
noremap <C-J> J
noremap <C-K> i<CR><Esc>

""" Window movement
noremap <Leader>wd <C-W>h
noremap <Leader>wh <C-W>j
noremap <Leader>wt <C-W>k
noremap <Leader>wn <C-W>l
noremap <Leader>wc <C-W>c
noremap <Leader>wo <C-W>o
noremap <Leader>ws <C-W>s
noremap <Leader>wv <C-W>v
noremap <Leader>w= <C-W>+
noremap <Leader>w- <C-W>-
noremap <Leader>w. <C-W>>
noremap <Leader>w, <C-w><

"" Plugin Keybinds
""" NERDTree
nnoremap <Leader>t :NERDTreeToggle<CR>:<BS>

""" undotree
nnoremap <Leader>u :UndotreeToggle<CR>:<BS>

""" vimagit and fugitive
nmap <Leader>gb :Gblame<CR>:<BS>
nmap <Leader>gc :Magit<CR>:<BS>
nmap <Leader>gd :Gvdiff<CR>:<BS>
nmap <Leader>gl :Glog<CR>:<BS>
nmap <Leader>gm :Gmerge<CR>:<BS>
nmap <Leader>gp :Gpull<CR>:<BS>
nmap <Leader>gs :Gpush<CR>:<BS>
nmap <Leader>gt :Gstatus<CR>:<BS>

""" MiniBufExpl
nmap <Leader>bo :MBEOpen<CR>:MBEFocus<CR>:<BS>
nmap <Leader>bq :MBEClose<CR>:<BS>

""" Grammarous
nnoremap <Leader>pg :GrammarousCheck<CR>
nnoremap <Leader>pr :GrammarousReset<CR>
nnoremap <Leader>ps :set spell!<CR>:<BS>
nmap <Leader>pn <Plug>(grammarous-move-to-next-error)
nmap <Leader>pp <Plug>(grammarous-move-to-previous-error)
nmap <Leader>pc <Plug>(grammarous-close-info-window)
nmap <Leader>pi <Plug>(grammarous-open-info-window)
nmap <Leader>pw <Plug>(grammarous-move-to-info-window)

""" Syntastic
nnoremap <Leader>se :Errors<CR>
nnoremap <Leader>st :SyntasticToggleMode<CR>
nnoremap <Leader>sc :SyntasticCheck<CR>
nnoremap <Leader>sr :SyntasticReset<CR>

"" Custom commands
""" Convenience commands
nnoremap <Leader>vc :let @/=""<CR>:<BS>
nnoremap <Leader>vh :set hlsearch! hlsearch?<CR>
nnoremap <Leader>vi :set ignorecase! ignorecase?<CR>
nnoremap <Leader>vw :set wrap! wrap?<CR>
nnoremap <Leader>vt "=strftime("%Y-%m-%d @ %H%M:")<CR>P
noremap <Leader>v= <C-A>
noremap <Leader>v- <C-X>
nnoremap <C-O> o<Esc>
nnoremap <C-A> O<Esc>
command -nargs=1 -complete=file Re edit +setlocal\ nomodifiable <args>

""" Hex conversions
nnoremap <Leader>xc :%!xxd<CR>:<BS>
nnoremap <Leader>xr :%!xxd -r<CR>:<BS>

""" Commands for writing (incl. MakeDoc build)
nnoremap <Leader>mt :!./build<CR>
nnoremap <Leader>mw :!./build web<CR>
nnoremap <Leader>md :!./build doc<CR>
nnoremap <Leader>mc :!./build clean<CR>
nnoremap <Leader>mp :!evince %:r.pdf &<CR>:<BS>
nnoremap <Leader>ms :call g:SprintMode()<CR>:<BS>
nnoremap <Leader>mn :! update_nano<CR>

" Custom functions (refactor into plugins?)
"" Word Sprint mode to black out text
let g:sprint_mode = 0

function! g:SprintMode()
    if g:sprint_mode == 0
        highlight Normal guifg=Black guibg=Black ctermfg=Black ctermbg=Black
        highlight Cursor guifg=Black guibg=Black ctermfg=Black ctermbg=Black
        setlocal nospell
        let g:sprint_mode = 1
        normal G
        normal o
        normal o
        normal o
        normal o
        startinsert!
    else
        colorscheme slate
        setlocal spell spelllang=en_us
        let g:sprint_mode = 0
    end
endfunction

"" Insert a basic HTML document into current buffer
function! WriteHTMLShell()
    " ~/.vim/templates/html
    r~/.vim/templates/html
endfunction

command! HTMLShell call WriteHTMLShell()

" Change the Vim working directory to the user's home directory.
cd ~
