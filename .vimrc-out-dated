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
set title

"" BELOW ARE WINDWOS AND NVIMQT SPECIFIC SETTINGS
"
" Allow right click, NVIMQT, for copy paste
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
" Windows CD into Documents
:cd $USERPROFILE\Documents
:set mouse=a

call plug#begin('~/AppData/Local/nvim/plugged')

"END WINDOWS SPECIFIC SETTINGS

highlight ColorColumn ctermbg=0 guibg=lightgrey
 
" Color schemes
 Plug 'morhetz/gruvbox'
 Plug 'jremmen/vim-ripgrep' "NOTE needs different config on Windows
 "Omnisharp is for C#
 Plug 'OmniSharp/omnisharp-vim'
 Plug 'nickspoons/vim-sharpenup' 

 " Fuzzy finder for recrusive file searching
 Plug 'junegunn/fzf' 
 Plug 'junegunn/fzf.vim' "The default vim implmentation of fzf

 " Git wrapper
 Plug 'tpope/vim-fugitive'
" Git What branch am I in?
 Plug 'vim-airline/vim-airline'
 " Man pages but currently not working properly
 Plug 'vim-utils/vim-man' 
 "Plug 'https://github.com/ycm-core/YouCompleteMe.git' 
 "Plug 'git@github.com:ycm-core/YouCompleteMe'
 Plug 'dense-analysis/ale'
 " Undo tree
 Plug 'mbbill/undotree'
 " Syntax highlighing but do we need this?
 Plug 'sheerun/vim-polyglot'
 Plug 'dbeniamine/cheat.sh-vim'
 "treesitter is currently crashing some aspects of NVim on windows
" Plug 'nvim-treesitter/nvim-treesitter'

 Plug 'neoclide/coc.nvim', {'branch': 'release'}

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | endif
 
call plug#end()

"" CheatSheet Config
""
" CheatSheet: {{{
" }}}
"
 "" C# Configuration
 ""
 let s:using_snippets = 0
" OmniSharp: {{{
 let g:OmniSharp_server_stdio = 1
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
"}}}

" SharpenUp: {{{ 
let g:sharpenup_statusline_opts = {
\ 'TextLoading': ' O#: %s loading... (%p of %P) ',
\ 'TextReady': ' O#: %s ',
\ 'TextDead': ' O#: Not running ',
\ 'Highlight': 1,
\ 'HiLoading': 'SharpenUpLoading',
\ 'HiReady': 'SharpenUpReady',
\ 'HiDead': 'SharpenUpDead'
\} "}}}

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | endif

"" Color Scheme
""
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
let g:ale_linters = { 'cpp':['gcc'], 'cs':['OmniSharp'] }
" }}}

" Asyncomplete: {{{
  let g:asyncomplete_auto_popup = 1
  let g:asyncomplete_auto_completeopt = 0
" }}

"" FZF Configuration
""
"show files in current dir 
"
"Bring up files menu in fzf
nnoremap <silent> <C-p> :Files<CR> 
" Files but with git ignore files ignored
nnoremap <silent> <C-g> :GFiles<CR>
nnoremap <silent> <C-o> :Buffers<CR>
nnoremap <silent> <C-f> :Rg 
" fzf: {{{ 
let g:fzf_action= {
\ 'ctrl-t': 'tab split',
\ 'ctrl-s': 'split',
\ 'ctrl-v': 'vsplit',
\} "}}}

"" Git configuration 
" (airline, fugitive etc.)
" diff get right side
nmap <leader>gf :diffget //2<CR>
" diff get left side
nmap <leader>gj :diffget //3<CR>
nmap <leader>gs :G<CR>

" COC 
let g:coc_disable_transparent_cursor = 1
