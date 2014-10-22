set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'gotcha/vimelette'
Plugin 'tpope/vim-vinegar'
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on
set autochdir
set hidden
set laststatus=2" always show a status line
set cmdheight=2" avoid 'Press ENTER to continue'
set showcmd" show partial commands in status line
set expandtab
set autowrite
set autoindent
set hlsearch
set incsearch
set backspace=indent,eol,start
set tw=79
set ruler
let mapleader=","

if !isdirectory($HOME . "/tmp/gotcha-dotfiles/vim/backups")
    call mkdir($HOME . "/tmp/gotcha-dotfiles/vim/backups", "p")
endif
if !isdirectory($HOME . "/tmp/gotcha-dotfiles/vim/undos")
    call mkdir($HOME . "/tmp/gotcha-dotfiles/vim/undos", "p")
endif
set backup " make backups
set backupdir=~/tmp/gotcha-dotfiles/vim/backups// " but don't clutter $PWD with them
set undofile " persist undos
set undodir=~/tmp/gotcha-dotfiles/vim/undos// " but don't clutter $PWD with them

" Fugitive

nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>ga :Gadd<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gco :Gcheckout<cr>
nnoremap <leader>gci :Gcommit -v<cr>
nnoremap <leader>gm :Gmove<cr>
nnoremap <leader>gr :Gremove<cr>
nnoremap <leader>gl :Shell git gl -18<cr>:wincmd \|<cr>

augroup ft_fugitive
    au!

    au BufNewFile,BufRead .git/index setlocal nolist
augroup END

" Solarized
set t_Co=256
if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized
