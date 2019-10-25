" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': '/bin/sh install.sh',
    \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'
Plug 'numkil/ag.nvim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'mhartington/oceanic-next'
Plug 'w0rp/ale'
Plug 'Shougo/echodoc.vim'
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

Plug 'tpope/vim-fugitive'
Plug 'lumiliet/vim-twig'
Plug 'airblade/vim-gitgutter'
Plug 'SirVer/ultisnips', {'for': 'php'} | Plug 'phux/vim-snippets', {'for': 'php'}
Plug 'StanAngeloff/php.vim'
Plug 'adoy/vim-php-refactoring-toolbox'
Plug 'ncm2/ncm2'
Plug 'phpactor/ncm2-phpactor'
Plug 'ncm2/ncm2-ultisnips'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'phpactor/phpactor', { 'do': 'composer install', 'for': 'php'}
Plug 'arnaud-lb/vim-php-namespace'
Plug 'alvan/vim-php-manual'
Plug 'janko-m/vim-test'

Plug 'skanehira/docker-compose.vim'
Plug 'kevinhui/vim-docker-tools'

" Initialize plugin system
call plug#end()

nnoremap Q <nop>

set hidden

augroup ncm2
  au!
  autocmd BufEnter * call ncm2#enable_for_buffer()
  au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
  au User Ncm2PopupClose set completeopt=menuone
augroup END

" cycle through completion entries with tab/shift+tab
inoremap <expr> <TAB> pumvisible() ? "\<c-n>" : "\<TAB>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<TAB>"

" context-aware menu with all functions (ALT-m)
nnoremap <C-m> :call phpactor#ContextMenu()<cr>

nnoremap gd :call phpactor#GotoDefinition()<CR>
nnoremap gr :call phpactor#FindReferences()<CR>

" Extract method from selection
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>
" extract variable
vnoremap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>
nnoremap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>
" extract interface
nnoremap <silent><Leader>rei :call phpactor#ClassInflect()<CR>

let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"

let g:vim_php_refactoring_default_property_visibility = 'private'
let g:vim_php_refactoring_default_method_visibility = 'private'
let g:vim_php_refactoring_auto_validate_visibility = 1
let g:vim_php_refactoring_phpdoc = "pdv#DocumentCurrentLine"
let g:vim_php_refactoring_use_default_mapping = 0
nnoremap <leader>rlv :call PhpRenameLocalVariable()<CR>
nnoremap <leader>rcv :call PhpRenameClassVariable()<CR>
nnoremap <leader>rrm :call PhpRenameMethod()<CR>
nnoremap <leader>reu :call PhpExtractUse()<CR>
vnoremap <leader>rec :call PhpExtractConst()<CR>
nnoremap <leader>rep :call PhpExtractClassProperty()<CR>
nnoremap <leader>rnp :call PhpCreateProperty()<CR>
nnoremap <leader>rdu :call PhpDetectUnusedUseStatements()<CR>
nnoremap <leader>rsg :call PhpCreateSettersAndGetters()<CR>

let g:phpactor_executable = '~/.config/nvim/plugged/phpactor/bin/phpactor'
let g:ncm2_phpactor_timeout = 10

function! PHPModify(transformer)
    :update
    let l:cmd = "silent !".g:phpactor_executable." class:transform ".expand('%').' --transform='.a:transformer
    execute l:cmd
endfunction

nnoremap <leader>rcc :call PhpConstructorArgumentMagic()<cr>
function! PhpConstructorArgumentMagic()
    " update phpdoc
    if exists("*UpdatePhpDocIfExists")
        normal! gg
        /__construct
        normal! n
        :call UpdatePhpDocIfExists()
        :w
    endif
    :call PHPModify("complete_constructor")
endfunction

nnoremap <leader>ric :call PHPModify("implement_contracts")<cr>
nnoremap <leader>raa :call PHPModify("add_missing_properties")<cr>

nnoremap <Leader>u :PHPImportClass<cr>
nnoremap <Leader>e :PHPExpandFQCNAbsolute<cr>
nnoremap <Leader>E :PHPExpandFQCN<cr>

let g:php_manual_online_search_shortcut = '<leader>k'

map <C-n> :NERDTreeToggle<CR>
nnoremap <Leader>n :NERDTreeToggle<cr>

set shortmess+=c

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" AK1 settings

set mouse=a
"<Leader> key is ,
let mapleader=","

set background=dark
colorscheme OceanicNext

"set shell=zsh\ --login
"Spaces, not tabs
set shiftwidth=4
set tabstop=4
set expandtab
set number relativenumber

nnoremap <Leader>w :w<CR>
vnoremap <Leader>w <Esc>:w<CR>
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>
vnoremap <C-s> <Esc>:w<CR>
nnoremap <Leader>h :nohl<CR>

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:ale_php_phpcbf_standard = 'PSR12'
let g:ale_php_phpcs_standard = 'PSR12'
" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1
let g:gitgutter_sign_column_always = 1

let test#strategy = "neovim"
let test#php#phpunit#executable = 'docker-compose run --rm -w /var/www/code test php vendor/bin/phpunit -c phpunit.xml'
nmap <silent> <leader>m :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
