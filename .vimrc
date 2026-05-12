
"   this is how a comment looks like in ~/.vimrc

" vimrc tutorial: https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/

"	use `:Stdheader` to add 42 header in VIM
"	according to https://github.com/42paris/42header
"	leg g:user42 = 'marvin'
"	let g:mail42 = 'marvin@student.42.fr'

let g:user42 = 'cmanuel-'
let g:mail42 = 'cmanuel-@student.42.fr'

" Use mouse
set mouse=a

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number

" add relative line numbers
" set relativenumber

" Highlight cursor line underneath the cursor horizontally.
" set cursorline

" Highlight cursor line underneath the cursor vertically.
" set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Ignore capital letters during search.
set ignorecase

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
" set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
" set wildmenu

" Make wildmenu behave like similar to Bash completion.
" set wildmode=list:longest

" make clipboard (copy-paste) available in vim
set clipboard=unnamedplus

syntax enable
set background=dark

" MAPPINGS --------------------------------------------------------------- {{{

" Set leader key
nnoremap <SPACE> <Nop>
let mapleader = " "

" Open netrw with <leader>cd
nnoremap <leader>cd :Ex<CR>

" move to next/prev buffer
" nnoremap <leader>l :bn<CR>
" nnoremap <leader>h :bp<CR>

" Move selected lines up/down (like Alt-Up/Down)
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Type jj to exit insert mode quickly.
inoremap jj <Esc>
" Make <C-c> behave like <Esc> in insert mode
inoremap <C-c> <Esc>

" Yank via OSCYank
nmap <leader>y <Plug>OSCYankOperator
vmap <leader>y <Plug>OSCYankVisual

" Reload vimrc (adjust path as needed)
nnoremap <leader>rl :source ~/.vim/vimrc<CR>

" Source current file
nnoremap <leader><leader> :so<CR>

" Key mappings
nnoremap gd :LspGotoDefinition<CR>
nnoremap gr :LspShowReferences<CR>
nnoremap K  :LspHover<CR>
nnoremap gl :LspDiag current<CR>

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" NERDTree specific mappings.
" Map the F3 key to toggle NERDTree open and close.
nnoremap <F3> :NERDTreeToggle<cr>

" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" }}}

" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}

" call plug#begin('~/.vim/plugged')
call plug#begin()
" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'       " auto-installs language servers
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'ojroques/vim-oscyank'
Plug 'tpope/vim-commentary'

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


" Key mappings
"nnoremap <silent> gd :LspDefinition<CR>
"nnoremap <silent> gr :LspReferences<CR>
"nnoremap <silent> K  :LspHover<CR>
"nnoremap <silent> <leader>rn :LspRename<CR>
"nnoremap <silent> <leader>ca :LspCodeAction<CR>

" Autocomplete with Tab
"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Plug 'yegappan/lsp'

call plug#end()

