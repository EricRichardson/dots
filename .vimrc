set number

set undofile
set undodir=~/.vim/undodir

autocmd InsertEnter * :set relativenumber
autocmd InsertLeave * :set norelativenumber

"set expandtab
set tabstop=4
set shiftwidth=4
set rtp+=~/.vim/bundle/Vundle.vim
set nocompatible
syntax enable
set hidden
set history=100
set updatetime=250
set autoindent
set path+=**
let mapleader=" "
map <leader>s :source ~/.vimrc<CR>
map <leader>nt :NERDTree<CR>
let g:NERDTreeQuitOnOpen = 1
nnoremap <leader>w :w<CR>
nnoremap <leader>o :CtrlP<CR>
nnoremap <leader>rt :NERDTreeFind<CR>
nnoremap <leader>q :q<CR>
nnoremap <c-j> 10j
nnoremap <c-k> 10k
nnoremap <c-l> 10l
nnoremap <c-h> 10h
set t_Co=256

call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'xuyuanp/nerdtree-git-plugin'
	Plugin 'fatih/vim-go'
	Plugin 'ctrlpvim/ctrlp.vim'
	Plugin 'leafgarland/typescript-vim'
	Plugin 'scrooloose/nerdtree'
	Plugin 'airblade/vim-gitgutter'
	Plugin 'scrooloose/nerdcommenter'
	Plugin 'altercation/vim-colors-solarized'
	Plugin 'vim-syntastic/syntastic'
	Plugin 'tpope/vim-rails'
	Plugin 'flazz/vim-colorschemes'
	Plugin 'SirVer/ultisnips'
	Plugin 'honza/vim-snippets'
call vundle#end()

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

filetype plugin on
let g:solarized_termcolors=256
"let g:go_fmt_autosave = 0

au Filetype go nnoremap <leader>gd :sp <CR>:exe "GoDef"<CR>
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta
set statusline+=%#warningmsg#
set statusline+=%*
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
let syntastic_mode_map = { 'passive_filetypes': ['html'] }

nnoremap ' `
nnoremap ` '

set hlsearch
" set incsearch

set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>l :set nolist!<CR>
set wildmenu
set wildmode=list:longest
set title
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
set ruler
set scrolloff=3
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

let NERDTreeShowLineNumbers=1

"set background=light
colorscheme Benokai
"colorscheme C64
"colorscheme Chasing_Logic

" opens search results in a window w/ links and highlight the matches
command! -nargs=+ Grep execute 'silent grep! -I -r -n --exclude *.{json,pyc} . -e <args>' | copen | execute 'silent /<args>'
" shift-control-* Greps for the word under the cursor
:nmap <leader>g :Grep <c-r>=expand("<cword>")<cr><cr>

function! SetupEnvironment()
  let l:path = expand('%:p')
  if l:path =~ '/Users/ericrichardson/koho/kohoadminweb'
    setlocal tabstop=2 shiftwidth=2 expandtab smarttab
  endif
  if l:path =~ '/Users/ericrichardson/koho/kohomobile'
    setlocal tabstop=4 shiftwidth=4 expandtab smarttab
  endif
  if l:path =~ '/Users/ericrichardson/mailer/'
    setlocal tabstop=2 shiftwidth=2 expandtab smarttab
  endif
endfunction
autocmd! BufReadPost,BufNewFile * call SetupEnvironment()
