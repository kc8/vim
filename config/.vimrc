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
set undodir=~/.vim/undodir
set undofile
set incsearch
set colorcolumn=80
set title

let is_os_windows = 0
" TODO can we just detect the OS?
if is_os_windows == 1
  " Allow right click, Nvim QT, for copy paste
  nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
  :cd $USERPROFILE\Documents
  :set mouse=a
  call plug#begin('~/AppData/Local/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

highlight ColorColumn ctermbg=0 guibg=lightgrey
 
" Color schemes
 Plug 'morhetz/gruvbox'

 "Omnisharp is for C#
Plug 'OmniSharp/omnisharp-vim'
Plug 'nickspoons/vim-sharpenup' 

" Fuzzy finder for recursive file searching
Plug 'junegunn/fzf' "{ 'do': {-> fzf#install() }}
Plug 'junegunn/fzf.vim' "The default vim implementation of fzf

" Git wrapper
Plug 'tpope/vim-fugitive'
" Git What branch am I in?
Plug 'vim-airline/vim-airline'

" Undo tree
Plug 'mbbill/undotree'

" Syntax highlighting but do we need this?
Plug 'sheerun/vim-polyglot'

Plug 'dbeniamine/cheat.sh-vim'

"NOTE treesitter is currently crashing some aspects of NVim on windows
if is_os_windows == 0
    Plug 'nvim-treesitter/nvim-treesitter'
endif

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'editorconfig/editorconfig-vim'

" TEST plugin
 
Plug 'kc8/first_vim_plugin'

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | endif
 
call plug#end()

 "" C# Configuration
source ~/.dotfiles/config/.vimconfigs/c_sharp.vim
" end C# config

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | endif

"" Color Scheme
""
" Colors {{{
 set background=dark
 colorscheme gruvbox
 " }}}
" ALE: {{{ TODO remove these?
"let g:ale_sign_error = '>'
"let g:ale_sign_warning = 'W•'
"let g:ale_sign_info = '·'
"let g:ale_sign_style_error = 'S'
"let g:ale_sign_style_warning = 'W'
"let g:ale_linters = { 'cpp':['gcc'], 'cs':['OmniSharp'] }
" }}}

" Asyncomplete: {{{
  let g:asyncomplete_auto_popup = 1
  let g:asyncomplete_auto_completeopt = 0
" }}

" FZF Configuration
" fzf files menu in current dir
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

" tooltip hover with cursor
nnoremap <silent> K :call CocAction('doHover')<CR>

" Required LSPs:
" Needs bash-language-server installed
let g:coc_global_extensions = [
      \ 'coc-tsserver', 
      \ 'coc-json', 
      \ 'coc-git',
      \ 'coc-json',
      \ 'coc-spell-checker',
      \ 'coc-metals',
      \ 'coc-java',
      \ 'coc-go',
      \ 'coc-css',
      \ 'coc-html',
      \ 'coc-markdown-preview-enhanced',
      \ 'coc-sh', 
      \ ]

" js specific depending on node modules used
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" **** COC Mappings **** 
" TODO pull this out into a seprate vimrc file 
" RESOURCE(S) FROM: https://github.com/scalameta/coc-metals/blob/main/coc-mappings.vim
" These default mappings should either go in your .vimrc or in a file that
" you're going to source from your .vimrc. For example, you can copy this file
" into your ~ directory and then put the following in your .vimrc to source it
"
" coc.nvim lsp mappings
"if filereadable(expand("~/coc-mappings.vim"))
"  source ~/coc-mappings.vim"
"endif
"
"
" If you're curious how to share this or your .vimrc with both vim and nvim,
" you can find a great instructions about this here
" https://neovim.io/doc/user/nvim.html#nvim-from-vim
"
" Finally, keep in mind that these are "suggested" settings. Play around with
" them and change them to your liking.

" From METALS documentation
" Help Vim recognize *.sbt and *.sc as Scala files
au BufRead,BufNewFile *.sbt,*.sc set filetype=scala

" If hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files
set nobackup
set nowritebackup

" You will have a bad experience with diagnostic messages with the default of 4000.
set updatetime=300

" Don't give |ins-completion-menu| messages.
set shortmess+=c

" Always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by another plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Used in the tab autocompletion for coc
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion. (ctrl + space in insert mode)
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" gd but in vsplit
nmap <silent> gp :vsp<CR><Plug>(coc-definition)

" For Neovim only!  Used to expand decorations in worksheets
nmap <Leader>ws <Plug>(coc-metals-expand-decoration)

" Use K to either doHover or show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType scala setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of current line
xmap <leader>a  <Plug>(coc-codeaction-line)
nmap <leader>a  <Plug>(coc-codeaction-line)

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" For Neovim only!  Trigger for code actions
" Make sure `"codeLens.enable": true` is set in your coc config
nnoremap <leader>cl :<C-u>call CocActionAsync('codeLensAction')<CR>

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Notify coc.nvim that <enter> has been pressed.
" Currently used for the formatOnType feature.
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Toggle panel with Tree Views
nnoremap <silent> <space>t :<C-u>CocCommand metals.tvp<CR>
" Toggle Tree View 'metalsPackages'
nnoremap <silent> <space>tp :<C-u>CocCommand metals.tvp metalsPackages<CR>
" Toggle Tree View 'metalsCompile'
nnoremap <silent> <space>tc :<C-u>CocCommand metals.tvp metalsCompile<CR>
" Toggle Tree View 'metalsBuild'
nnoremap <silent> <space>tb :<C-u>CocCommand metals.tvp metalsBuild<CR>
" Reveal current current class (trait or object) in Tree View 'metalsPackages'
nnoremap <silent> <space>tf :<C-u>CocCommand metals.revealInTreeView metalsPackages<CR>


" Highlighting on yanks!
" see :help yank.highlight.on_yank() for details
" Highlight yi and yw
augroup LuaHighlight
au!
au TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

