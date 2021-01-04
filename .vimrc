syntax on 

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab 
set smartindent
set nu 
set nowrap
set smartcase
set noswapfile
set nobackup 
set undodir=~/.vim./undodir
set undofile
set incsearch

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/vim/plugged')
 
 Plug 'preservim/nerdtree'
 Plug 'gruvbox-community/gruvbox'
 Plug 'jremmen/vim-ripgrep'
 Plug 'tpope/vim-fugitive'
 Plug 'vim-utils/vim-man'
 Plug 'lyuts/vim-rtags'
 Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
 Plug 'https://github.com/ycm-core/YouCompleteMe.git' 
 Plug 'mbbill/undotree'
 Plug 'OmniSharp/omnisharp-vim'
 Plug 'https://github.com/OrangeT/vim-csharp.git'
 Plug 'ckspoons/vim-sharpenup' 
 Plug 'dense-analysis/ale'
 "Was causing issues
"Plug 'prabirshrestha/asyncomplete.vim'


 call plug#end()
 
 "C# Configuration
 let s:using_snippets = 0
" OmniSharp: {{{
 let g:OmniSharp_popup_position = 'peek'
 if has('nvim')
       let g:OmniSharp_popup_options = {
         \ 'winhl': 'Normal:NormalFloat'
         \}
   else
         let g:OmniSharp_popup_options = {
           \ 'highlight': 'Normal',
           \ 'padding': [0, 0, 0, 0],
           \ 'border': [1]
           \}
     endif
     let g:OmniSharp_popup_mappings = {
                 \ 'sigNext': '<C-n>',
                 \ 'sigPrev': '<C-p>',
                 \ 'pageDown': ['<C-f>', '<PageDown>'],
                 \ 'pageUp': ['<C-b>', '<PageUp>']
                 \}
   if s:using_snippets
       let g:OmniSharp_want_snippet = 1
   endif
       let g:OmniSharp_highlight_groups = {
                   \ 'ExcludedCode': 'NonText'
       \}
" }}}

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Colors {{{
 set background=dark
 colorscheme gruvbox
 " }}}
 
" ALE: {{{
let g:ale_sign_error = '>'
let g:ale_sign_warning = 'W•'
let g:ale_sign_info = '·'
let g:ale_sign_style_error = 'S'
let g:ale_sign_style_warning = 'W'
let g:ale_linters = { 'cs': ['OmniSharp'] }
" }}}

" Asyncomplete: {{{
  let g:asyncomplete_auto_popup = 1
  let g:asyncomplete_auto_completeopt = 0
" }}}
