 "" C# Configuration
 ""
 let s:using_snippets = 0
" OmniSharp: {{{
 let g:OmniSharp_server_stdio = 0
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

let g:github_enterprise_urls = ['https://ghe.coxautoinc.com']

