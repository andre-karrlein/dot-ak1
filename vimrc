set nocompatible               " be iMproved

filetype off                   " required!

"<Leader> key is ,
let mapleader=","

" Vundle init
set rtp+=~/.vim/bundle/vundle/

" Require Vundle
try
    call vundle#rc()
catch
    echohl Error | echo "Vundle is not installed. Run 'cd ~/.vim/ && git submodule init && git submodule update'" | echohl None
endtry


"{{{ Vundle Bundles!
if exists(':Bundle')
    Bundle 'gmarik/vundle'

    " Plugins
    Bundle 'joonty/vim-do'
    Bundle 'Lokaltog/vim-easymotion'
    Bundle 'scrooloose/nerdtree.git'
    Bundle 'joonty/vim-sauce.git'
    Bundle 'joonty/vdebug.git'
    Bundle 'joonty/vim-taggatron.git'
    Bundle 'tpope/vim-fugitive.git'
    Bundle 'tpope/vim-commentary.git'
    Bundle 'tpope/vim-endwise.git'
    Bundle 'ervandew/supertab.git'
    Bundle 'joonty/vim-tork.git'
    Bundle 'rking/ag.vim'
    Bundle 'roman/golden-ratio'
    Bundle 'pelodelfuego/vim-swoop'
    Bundle 'ctrlpvim/ctrlp.vim'
    Bundle 'itchyny/lightline.vim'
    Bundle 'godlygeek/tabular'
    Bundle 'joonty/vim-phpqa.git'
    Bundle 'shawncplus/phpcomplete.vim'

    " Language support
    Bundle 'scrooloose/syntastic.git'
    Bundle 'tpope/vim-markdown.git'
    Bundle 'othree/html5.vim.git'
    Bundle 'StanAngeloff/php.vim.git''
    Bundle 'hdima/python-syntax.git'

    " Colors
    Bundle 'chriskempson/vim-tomorrow-theme'
end
"}}}

filetype plugin indent on     " required!
syntax enable
" colorscheme Tomorrow-Night
runtime macros/matchit.vim
let g:EasyMotion_leader_key = '\'



"{{{ Functions
"{{{ Toggle relative and absolute line numbers
function! LineNumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc
"}}}
"{{{ Toggle the arrow keys

let g:arrow_keys_enabled = 1

"{{{ Get visual selection
function! GetVisualSelection()
  " Why is this not a built-in Vim script function?!
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction
"}}}
"{{{ Where() -> show current file location
function! Where()
  echo expand("%:p")
endfunction
"}}}


"{{{ Settings
set ttyscroll=0
set hidden
set history=1000
set ruler
set ignorecase
set smartcase
set title
set scrolloff=3
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set wrapscan
set clipboard=unnamed
set visualbell
set backspace=indent,eol,start
"Status line coolness
set laststatus=2
set showcmd
" Search things
set hlsearch
set incsearch " ...dynamically as they are typed.
set listchars=tab:>-,trail:·,eol:$
" Folds
set foldmethod=marker
set wildmenu
set wildmode=list:longest,full
set mouse=a
set nohidden
set shortmess+=filmnrxoOt
set viewoptions=folds,options,cursor,unix,slash
set virtualedit=onemore
set shell=zsh\ --login
"Spaces, not tabs
set shiftwidth=4
set tabstop=4
set expandtab

"Speed highlighting up
set nocursorcolumn
set nocursorline
syntax sync minlines=256

" Ignore stuff
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.DS_Store

" Line numbers
set relativenumber
"}}}

let g:NERDTreeMapHelp = "h"


"{{{ Key Maps
" Fast saving
nnoremap <Leader>w :w<CR>
vnoremap <Leader>w <Esc>:w<CR>
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>
vnoremap <C-s> <Esc>:w<CR>

nnoremap <Leader>x :x<CR>
vnoremap <Leader>x <Esc>:x<CR>

" Stop that damn ex mode
nnoremap Q <nop>

" Quickfix!
nnoremap <Space>] :cnext<CR>
nnoremap <Space>[ :cprev<CR>
nnoremap <Space>q :cclose<CR>
nnoremap <Space>o :cope<CR>

" Quick nohl
nnoremap <Leader>h :nohl<CR>

" Line number type toggle
nnoremap <Leader>l :call LineNumberToggle()<cr>

" Quick search
nnoremap <C-f> :Ag ''<left>
" Quick search - word under cursor
nnoremap <Leader>f :Ag <cword><CR>
inoremap <Leader>f :Ag <cword><CR>
vnoremap <Leader>f :<C-U>exec ":Ag '" . GetVisualSelection() ."'"<CR>
" Quick search - method call under cursor
nnoremap <Leader>m :Ag \.<cword>\b<CR>
inoremap <Leader>m :Ag \.<cword>\b<CR>
vnoremap <Leader>m :<C-U>exec ":Ag '\." . GetVisualSelection() ."\b'"<CR>
" Quick search - word under cursor in current file
nnoremap <Leader>t :Ag <cword> %:p<CR>
inoremap <Leader>t :Ag <cword> %:p<CR>
vnoremap <Leader>t :<C-U>exec ":Ag '" . GetVisualSelection() ."' %:p"<CR>
" Quick search - method definition under cursor
nnoremap <Leader>d :Ag def\ \(self\.\)\?\<cword><CR>
inoremap <Leader>d :Ag def\ \(self\.\)\?\<cword><CR>

" Ctrl-P
let g:ctrlp_lazy_update = 1
let g:ctrlp_regexp = 1
let g:ctrlp_user_command = 'ag -l . %s'
nnoremap <Space>t :CtrlPCurWD<CR>
nnoremap <Space>l :CtrlPLine<CR>
nnoremap <Space>f :CtrlPCurFile<CR>
nnoremap <Space>s :CtrlPBufTag<CR>
nnoremap <Space>b :CtrlPBuffer<CR>

" Instead of 1 line, move 3 at a time
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Show hidden characters (spaces, tabs, etc)
nmap <silent> <leader>s :set nolist!<CR>

" PHPDoc commands
inoremap <C-d> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-d> :call PhpDocSingle()<CR>
vnoremap <C-d> :call PhpDocRange()<CR>

" Fugitive shortcuts
nnoremap <Leader>c :Gcommit -a<CR>i
nnoremap <Leader>a :Git add %:p<CR>

"}}}

" Quick insert mode exit
imap jk <Esc>

" Tree of nerd
nnoremap <Leader>n :NERDTreeToggle<CR>

" Tabularize
vnoremap <Leader>t= :Tabularize /=<CR>
vnoremap <Leader>t, :Tabularize /,<CR>
vnoremap <Leader>t" :Tabularize /"<CR>
vnoremap <Leader>t' :Tabularize /'<CR>
vnoremap <Leader>t: :Tabularize /:<CR>

" Show trailing white space
hi ExtraSpace ctermbg=red guibg=red
match ExtraSpace /\s\+$/
autocmd BufWinEnter * match ExtraSpace /\s\+$/
autocmd InsertEnter * match ExtraSpace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraSpace /\s\+$/
autocmd BufWinLeave * call clearmatches()
nnoremap <leader>z :%s/\s\+$//<cr>:let @/=''<CR>

map <leader>l :w !php -l %<CR>

autocmd filetype crontab setlocal nobackup nowritebackup

" Tab completion - local
let g:SuperTabDefaultCompletionType = "<c-n>"

" Vdebug options
let g:vdebug_options = {"on_close":"detach", "debug_file":"~/vdebug.log", "debug_file_level":2}

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_enable_balloons = 1
let g:syntastic_mode_map = { 'mode': 'active',
            \                   'active_filetypes' : [],
            \                   'passive_filetypes' : ['php'] }
let g:syntastic_eruby_ruby_quiet_messages =
    \ {'regex': 'possibly useless use of a variable in void context'}

let g:syntastic_error_symbol = "❌"
let g:syntastic_warning_symbol = "⚠️"
highlight SyntasticErrorSign guifg=white
highlight SyntasticWarningSign guifg=white

let NERDTreeIgnore = ['\.pyc$','\.sock$']

let g:vdebug_features = {'max_depth':3}
let g:taggatron_run_in_background = 1

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

let g:golden_ratio_exclude_nonmodifiable = 1
let g:golden_ratio_wrap_ignored = 0
