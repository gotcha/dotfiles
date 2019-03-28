set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-apathy'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-unimpaired'
Plugin 'wikitopian/hardmode'
Plugin 'tpope/vim-rhubarb'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'w0rp/ale'
Plugin 'gotcha/vimelette'
Plugin 'tpope/vim-vinegar'
Plugin 'altercation/vim-colors-solarized'
" robot framework syntax
Plugin 'mfukar/robotframework-vim'
" lines and prompts
Plugin 'bling/vim-airline'
Plugin 'edkolev/promptline.vim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'tpope/vim-obsession'
Plugin 'nvie/vim-flake8'
Plugin 'rodjek/vim-puppet'
" text objects
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'wellle/targets.vim'
Plugin 'roman/golden-ratio'
Plugin 'elmcast/elm-vim'
Plugin 'yggdroot/indentline'
Plugin 'airblade/vim-gitgutter'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'wincent/ferret'
Plugin 'junegunn/gv.vim'
Plugin 'aymericbeaumet/symlink.vim'

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

let backups_directory = $HOME . "/dotfiles/tmp/vim/backups"
if !isdirectory(backups_directory)
    call mkdir(backups_directory, "p")
    echom "made dir " . backups_directory
endif
let undos_directory = $HOME . "/dotfiles/tmp/vim/undos"
if !isdirectory(undos_directory)
    call mkdir(undos_directory, "p")
    echom "made dir " . undos_directory
endif
set backup " make backups
let &backupdir=backups_directory . '//' " but don't clutter $PWD with them
let &directory=backups_directory . '//' " but don't clutter $PWD with them
set undofile " persist undos
let &undodir=undos_directory . '//' " but don't clutter $PWD with them

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
if has('gui_running')
    set background=light
else
    set background=dark
endif
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termcolors = 16
colorscheme solarized

" Vimelette
let g:debug_vimelette = 1

" Airline
let g:airline_powerline_fonts = 1

" Bufexplorer
nnoremap <leader>b :BufExplorer<cr>
inoremap <leader>b <Esc>:BufExplorer<cr>
vnoremap <leader>b <Esc>:BufExplorer<cr>

" Dash
function! s:doc(cmd)
  if exists(':Dash')
    return a:cmd
  endif
  return 'K'
endfunction

nmap <expr> K <SID>doc("\<Plug>DashSearch")
nmap <expr> <Leader>K <SID>doc("\<Plug>DashGlobalSearch")


let g:netrw_list_hide = ".*\.pyc$,.*\.pyo$,.*\.swp$"

" Wildmenu completion

set wildmenu
set wildmode=list:longest

set wildignore+=.hg,.git,.svn " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.sw? " Vim swap files
set wildignore+=*.DS_Store " OSX bullshit
set wildignore+=*.pyc,*.pyo " Python byte code
set wildignore+=*.mo " Compiled gettext

set relativenumber
set number

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

imap jk <Esc>

" elm
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

let g:elm_syntastic_show_warnings = 1
let g:elm_setup_keybindings = 0
let g:elm_format_autosave = 1
let g:elm_jump_to_error = 1

autocmd BufRead,BufNewFile *.zcml :set ft=xml 
