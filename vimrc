" Basic functional settings
set nocompatible

"" Buffer text formatting
set encoding=utf-8
set ffs=unix,dos
set ruler
set formatoptions=t
set textwidth=119
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
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2

""" Miscellaneous
set autoread
set cm=blowfish2
set ignorecase
set viminfo=
set wildmenu
set wrap
colorscheme slate

"" Plugin pre-load settings
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
let NERDTreeMapOpenInTabSilent = '\T'

""" Taskwarrior
let g:task_report_command = ['today']
let g:task_report_name = 'today'

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
Plugin 'Valloric/YouCompleteMe.git'
Plugin 'tpope/vim-fugitive'
Plugin 'renyard/vim-git-flow-format'
Plugin 'fatih/vim-go'
Plugin 'leafgarland/typescript-vim'
Plugin 'DerHabicht/bufexplorer'
if !has("win32")
    Plugin 'blindFS/vim-taskwarrior'
endif

""" Finalize Vundle
call vundle#end()
filetype plugin indent on

"" Plugin post-load settings

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
map <Leader>wd <C-W>h
map <Leader>wh <C-W>j
map <Leader>wt <C-W>k
map <Leader>wn <C-W>l
map <Leader>wc <C-W>c
map <Leader>wo <C-W>o
map <Leader>ws <C-W>s
map <Leader>wv <C-W>v
map <Leader>w= <C-W>+
map <Leader>w- <C-W>-
map <Leader>w. <C-W>>
map <Leader>w, <C-w><

"" Plugin Keybinds
""" NERDTree
map <Leader>t :NERDTreeToggle<CR>:<BS>

""" undotree
map <Leader>u :UndotreeToggle<CR>:<BS>

""" vimagit and fugitive
map <Leader>gb :Gblame<CR>:<BS>
map <Leader>gc :Magit<CR>:<BS>
map <Leader>gd :Gvdiff<CR>:<BS>
map <Leader>gl :Glog<CR>:<BS>
map <Leader>gm :Gmerge<CR>:<BS>
map <Leader>gp :Gpull<CR>:<BS>
map <Leader>gs :Gpush<CR>:<BS>
map <Leader>gt :Gstatus<CR>:<BS>

""" vim-go
map <Leader>ob :GoBuild<CR>
map <Leader>oi :GoInstall<CR>
map <Leader>of :GoTestFunc<CR>
map <Leader>or :GoRun<CR>
map <Leader>ot :GoTest<CR>
map <Leader>od :GoDef<CR>
map <Leader>oc :GoCoverage<CR>

""" Grammarous
map <Leader>pg :GrammarousCheck<CR>
map <Leader>pr :GrammarousReset<CR>
map <Leader>ps :set spell!<CR>:<BS>
map <Leader>pn <Plug>(grammarous-move-to-next-error)
map <Leader>pp <Plug>(grammarous-move-to-previous-error)
map <Leader>pc <Plug>(grammarous-close-info-window)
map <Leader>pi <Plug>(grammarous-open-info-window)
map <Leader>pw <Plug>(grammarous-move-to-info-window)

""" Syntastic
nnoremap <Leader>se :Errors<CR>
nnoremap <Leader>st :SyntasticToggleMode<CR>
nnoremap <Leader>sc :SyntasticCheck<CR>
nnoremap <Leader>sr :SyntasticReset<CR>

""" Taskwarrior
map <Leader>a :TW<CR>

"" Custom commands
""" Convenience commands
map <Leader>e :call g:BlackOut()<CR>
imap <C-e> <Esc>:call g:BlackOut()<CR>
map <Leader>vb :!bash<CR>
map <Leader>vc :let @/=""<CR>:<BS>
map <Leader>vh :set hlsearch! hlsearch?<CR>
map <Leader>vi :set ignorecase! ignorecase?<CR>
map <Leader>vw :set wrap! wrap?<CR>
map <Leader>vt "=strftime("%Y-%m-%d @ %H%M:")<CR>P
map <Leader>v= <C-A>
map <Leader>v- <C-X>
map <C-O> o<Esc>
map <C-A> O<Esc>
command -nargs=1 -complete=file Re edit +setlocal\ nomodifiable <args>
command -nargs=1 Task read !task <args> uuids
nnoremap <Leader>i <C-a>
nnoremap <Leader>d <C-x>
map <Leader>x :!%:p<CR>

""" Hex conversions
map <Leader>hc :%!xxd<CR>:<BS>
map <Leader>hr :%!xxd -r<CR>:<BS>

""" Commands for writing (incl. MakeDoc build)
map <Leader>ml :!lualatex %<CR>
map <Leader>mt :!./build<CR>
map <Leader>mw :!./build web<CR>
map <Leader>md :!./build doc<CR>
map <Leader>mc :!./build clean<CR>
map <Leader>mp :!evince %:r.pdf &<CR>:<BS>
map <Leader>ms :call g:SprintMode()<CR>:<BS>
map <Leader>mn :! update_nano<CR>

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

function! g:BlackOut()
    if !exists('b:blackout')
        let b:blackout = 1
        let b:syntax = &syntax
        set syntax=
        highlight Normal guifg=Black guibg=Black ctermfg=Black ctermbg=Black
        highlight Cursor guifg=Black guibg=Black ctermfg=Black ctermbg=Black
        setlocal nospell
    else
        colorscheme slate
        setlocal spell spelllang=en_us
        execute 'let &syntax = b:syntax'
        unlet b:blackout
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
