" Disable Vi compatability and force Unix formatting
set nocompatible
filetype off
set encoding=utf-8
set ffs=unix,dos

" Vim Pandoc settings
let g:pandoc#formatting#mode = "h"

" Grammarous settings
let g:grammarous#disabled_rules = {'*': ['EN_QUOTES'],}

" NERDTree settings
let NERDTreeMapOpenInTab='\t'

" Vundle setup
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Vundle Plugins
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
Plugin 'git@github.com:Valloric/YouCompleteMe.git'

" Finalize Vundle
call vundle#end()
filetype plugin indent on

let mapleader = " "

" More NERDTree settings
nnoremap <Leader>t :NERDTreeToggle<CR>

" More undotree settings
nnoremap <Leader>u :UndotreeToggle<CR>

" Turn on wildmenu
set wildmenu

" Keybind to switch case searching and default to ignore case
set ignorecase
nnoremap <F4> :set ignorecase! ignorecase?<CR>

" Keybind to enable visual line wrapping, defaulting to wrap
set wrap
nnoremap <F5> :set wrap! wrap?<CR>

" Bind hex conversions to F9 and F10
nnoremap <F9> :%!xxd<CR>
nnoremap <F10> :%!xxd -r<CR>

" Key configuration
"" Unmap the 's' command, since this is a habit I need to kill
nnoremap s <NOP>
vnoremap s <NOP>

"" Prevent backspacing over a new line
set backspace=indent,start

"" Set folding to indent
set foldmethod=indent

"" Place a timestamp by pressing F2
nnoremap <F2> "=strftime("%Y-%m-%d @ %H%M:")<CR>P
inoremap <F2> <C-R>=strftime("%Y-%m-%d @ %H%M:")<CR>

"" Get a word count on the current contents of the buffer with F3
nnoremap <F3> :w !wc -w<CR>

"" Map Ctl + O to o and Ctl + A to O without entering Insert mode
nnoremap <C-O> o<Esc>
nnoremap <C-A> O<Esc>

"" Map Ctl + Y and Ctl + P to handle numerical increment/decrement
noremap <C-Y> <C-A>
noremap <C-P> <C-X>

"" Remap movement keys to retain their physical position on the Dvorak layout
noremap d h
vnoremap d h
noremap h gj
vnoremap h gj
noremap t gk
vnoremap t gk
noremap n l
vnoremap n l

"" Use H and T for half-page moves
noremap H <C-D>
noremap T <C-U>

"" Remap window movement to the Dvorak keys
noremap <Leader>wd <C-W>h
noremap <Leader>wh <C-W>j
noremap <Leader>wt <C-W>k
noremap <Leader>wn <C-W>l

"" Tweak indent and un-indent commands to align with movement keys
inoremap <C-N> <C-T>

"" Remap j, k, and l to the functions previously done by d, n, and t
""  Since these function keys moved around, I came up with new mnemonics:
""   -  'jerk' for delete
""   -  'keep looking' for next search
""   -  'look' for what t used to do (I didn't know a mnemonic for t)
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

"" Remap the J function to Ctl + J and add a split line function
""  I use 'Kut line' as the mnemonic for splitting a line
noremap <C-J> J
noremap <C-K> i<CR><Esc>

" Text formatting
"" Tab settings
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set nolist
"set list
"set listchars=tab:\|\ |
set expandtab

"" Include *.m4 as a pandoc file
autocmd BufNewFile,BufRead *.m4 set filetype=pandoc

"" Javascript, CSS, and HTML overrides for tabs
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2

"" Word wrapping
set ruler
set formatoptions=t
set textwidth=79

" Search highligting
set incsearch
set smartcase

" Other settings
"" Automatically refresh files modified outside of Vim
set autoread

command -nargs=1 -complete=file Re edit +setlocal\ nomodifiable <args>

"" Make the text impossible to see when attempting to write a word sprint.
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

nnoremap <F7> :call g:SprintMode()<CR>
inoremap <F7> <Esc>:call g:SprintMode()<CR>
nnoremap <F8> :! update_nano<CR>

nnoremap <Leader>mt :!./build<CR>
nnoremap <Leader>mw :!./build web<CR>
nnoremap <Leader>md :!./build doc<CR>
nnoremap <Leader>mc :!./build clean<CR>
nnoremap <Leader>mp :!evince %:r.pdf &<CR>

nnoremap <Leader>pg :GrammarousCheck<CR>
nnoremap <Leader>pr :GrammarousReset<CR>
nmap <Leader>pn <Plug>(grammarous-move-to-next-error)
nmap <Leader>pp <Plug>(grammarous-move-to-previous-error)
nmap <Leader>pc <Plug>(grammarous-close-info-window)
nmap <Leader>pi <Plug>(grammarous-open-info-window)
nmap <Leader>pw <Plug>(grammarous-move-to-info-window)

"" Add word count to the status line
function! WordCount()
    let s:old_status = v:statusmsg
    let position = getpos(".")
    exe ":silent normal g\<c-g>"
    let stat = v:statusmsg
    let s:word_count = 0
    if stat != '--No lines in buffer--'
        let s:word_count = str2nr(split(v:statusmsg)[11])
        let v:statusmsg = s:old_status
    end
    call setpos('.', position)
    return s:word_count
endfunction

function! WriteHTMLShell()
    " ~/.vim/templates/html
    r~/.vim/templates/html
endfunction

command! HTMLShell call WriteHTMLShell()

set statusline=[%f\ -\ %y]\ <%c,%l/%L>\ (wc:%{WordCount()})
set laststatus=2

" Clean up trailing spaces before write
autocmd BufWritePre * :%s/\s\+$//e

" Change the Vim working directory to the user's home directory.
cd ~

" Set color scheme
":highlight Normal ctermbg=slate
colorscheme slate
