set nocompatible              " be iMproved, required
filetype off                  " required

set gfn=Meslo\ LG\ S\ DZ\ for\ Powerline:h16

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'yegappan/grep'
Plugin 'markonm/traces.vim'
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
Plugin 'tpope/vim-sleuth'
Plugin 'wikitopian/hardmode'
Plugin 'tpope/vim-rhubarb'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'dense-analysis/ale'
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
Plugin 'direnv/direnv.vim'
Plugin 'romainl/vim-devdocs'
Plugin 'rust-lang/rust.vim'
Plugin 'rhysd/git-messenger.vim'
Plugin 'LnL7/vim-nix'
Plugin 'sodapopcan/vim-twiggy'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'benmills/vimux'
Plugin 'vmchale/dhall-vim'
" Plugin 'SirVer/ultisnips'
Plugin 'alfredodeza/pytest.vim'
Plugin 'editorconfig/editorconfig-vim'
" Plugin 'prabirshrestha/vim-lsp'
" Plugin 'rhysd/vim-lsp-ale'
" Plugin 'mattn/vim-lsp-settings'
Plugin 'voldikss/vim-floaterm'
Plugin 'liuchengxu/vim-which-key'
" Plugin 'puremourning/vimspector'
"Plugin 'ervandew/supertab'


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
nnoremap <silent> <leader>      :<c-u>WhichKey ','<CR>

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

" Fugitivesymotion-prefix)
nnoremap <leader>gs :Git<cr>
nnoremap <leader>ga :Git add<cr>
nnoremap <leader>gb :Git blame<cr>
nnoremap <leader>gco :Git checkout<cr>
nnoremap <leader>gci :Git commit -v<cr>
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
"let g:debug_vimelette = 1

" Airline
let g:airline_powerline_fonts = 1

" Bufexplorer
" nnoremap <leader>b :ToggleBufExplorer<cr>
" inoremap <leader>b <Esc>:ToggleBufExplorer<cr>
" vnoremap <leader>b <Esc>:ToggleBufExplorer<cr>

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
set scrolloff=7

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

" zcml
autocmd BufRead,BufNewFile *.zcml :set ft=xml 

" zpt
autocmd BufRead,BufNewFile *.pt set ft=zpt 
    \ | set syntax=html
autocmd BufRead,BufNewFile *.zpt set ft=zpt 
    \ | set syntax=html


" stencil tsx
autocmd BufRead,BufNewFile *.tsx :set ft=javascript

" rust
let g:rustfmt_autosave = 1
let g:rust_fold = 1

noremap ù<C-I> [<C-I>
noremap ù<C-D> [<C-D>
au FileType python let &l:define = '^\s*\(class\|def\|\ze\i\+\s*=\)'

" netrw try to fix readonly buffers
"
let g:netrw_fastbrowse=0

"unimpaired
nmap { [
nmap } ]
omap { [
omap } ]
xmap { [
xmap } ]

"Twiggy
nnoremap <leader>t :Twiggy<cr>

" FZF
nnoremap <leader>fb :Buffers<cr>
nnoremap <leader>ff :Files<cr>


" call ale#linter#Define('cfg', {
"  \   'name': 'buildout',
"  \   'lsp': 'stdio',
"  \   'executable': '/Users/gotcha/software/buildout-lsp/bin/buildoutls',
"  \   'command': '%e run',
"  \   'project_root': '/path/to/root_of_project',
"  \})

let g:EditorConfig_exclude_patterns = ['fugitive://.*']


 let g:lsp_settings = {
 \  'efm-langserver': {
 \    'disabled': 0,
 \   },
 \ }

let g:ale_linters = {
    \   'yaml': ['vim-lsp'],
    \   'zpt': ['vim-lsp'],
    \ }

let g:netrw_keepdir = 0

" Floaterm
hi Floaterm guibg=black
nnoremap <leader>ft :FloatermToggle<cr>
tnoremap <leader>ft <C-w>:FloatermToggle<cr>

" autocmd User DirenvLoaded :echo 'loaded extra vimrc'
