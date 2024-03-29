set shell=/bin/bash
filetype off
filetype plugin indent off

" mapping
let g:mapleader = ','
let g:maplocalleader = '\'

" option
set signcolumn=yes
set completeopt-=preview
set omnifunc=lsp#complete

" vim-plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'cocopon/iceberg.vim'
Plug 'scrooloose/nerdtree'

Plug 'prabirshrestha/async.vim' | Plug 'prabirshrestha/vim-lsp'
Plug 'lighttiger2505/deoplete-vim-lsp' | Plug 'Shougo/deoplete.nvim'
Plug 'itchyny/lightline.vim'
Plug 'liuchengxu/vista.vim'
Plug 'lambdalisue/vim-quickrun-neovim-job' | Plug 'thinca/vim-quickrun'

call plug#end()

" deoplete.nvim
let g:deoplete#enable_at_startup = 1

inoremap <expr><C-h> deoplete#smart_close_popup()."<C-h>"
inoremap <expr><BS> deoplete#smart_close_popup()."<C-h>"

call deoplete#custom#option({
    \ 'auto_complete': v:true,
    \ 'min_pattern_length': 2,
    \ 'auto_complete_delay': 0,
    \ 'auto_refresh_delay': 20,
    \ 'refresh_always': v:true,
    \ 'smart_case': v:true,
    \ 'camel_case': v:true,
    \ })
let s:use_lsp_sources = ['lsp', 'dictionary', 'file']
call deoplete#custom#option('sources', {
\ 'go': s:use_lsp_sources,
\ 'python': s:use_lsp_sources,
\ 'vim': ['vim', 'buffer', 'dictionary', 'file'],
\})

" vim-lsp
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_virtual_text_enabled = 1
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼'}
let g:lsp_signs_information = {'text': 'i'}
let g:lsp_signs_hint = {'text': '?'}

augroup LspAutoFormatting
    autocmd!
    autocmd BufWritePre *.py LspDocumentFormatSync
augroup END

nnoremap <C-]> :<C-u>LspDefinition<CR>
nnoremap K :<C-u>LspHover<CR>
nnoremap <LocalLeader>R :<C-u>LspRename<CR>
nnoremap <LocalLeader>n :<C-u>LspReferences<CR>
nnoremap <LocalLeader>f :<C-u>LspDocumentDiagnostics<CR>
nnoremap <LocalLeader>s :<C-u>LspDocumentFormat<CR>

" vista.vim
let g:vista_echo_cursor = 0
let g:vista_default_executive = 'ctags'
let g:vista#renderer#enable_icon = 1
let g:vista_executive_for = {
    \ 'go': 'vim_lsp',
    \ 'python': 'vim_lsp',
    \ }
nnoremap <silent> <Leader>o :<C-u>Vista!!<CR>

" lightline.vim
let g:lightline = {
    \ 'colorscheme': 'iceberg',
    \ 'active': {
    \   'left':  [ ['mode', 'paste'], ['readonly', 'myfilename', 'method', 'modified'], ],
    \   'right': [ [ 'lineinfo' ], [ 'percent' ], ['char_code', 'fileformat', 'fileencoding', 'filetype' ], ],
    \ },
    \ 'component_function': {
    \   'myfilename': 'LightlineFilename',
    \   'method': 'NearestMethodOrFunction',
    \ },
    \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
    \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
    \ }

function! LightlineFilename()
    let l:p = expand('%:t')
    if '' !=# l:p
        return l:p
    endif
    return '[No Name]'
endfunction

function! NearestMethodOrFunction() abort
    let l:func_name = get(b:, 'vista_nearest_method_or_function', '')
    if l:func_name != ''
        return ' ' . l:func_name
    endif
    return ''
endfunction

augroup LightLineOnVista
    autocmd!
    autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
augroup END


" vim-quickrun
let g:quickrun_no_default_key_mappings = 1
let g:quickrun_config = {
    \ '_' : {
        \ 'outputter' : 'error',
        \ 'outputter/error/success' : 'buffer',
        \ 'outputter/error/error'   : 'quickfix',
        \ 'outputter/buffer/split' : ':botright 8sp',
    \ }
\}

if has('nvim')
    let g:quickrun_config._.runner = 'neovim_job'
elseif exists('*ch_close_in')
    let g:quickrun_config._.runner = 'job'
endif

nnoremap <Leader>r :<C-U>QuickRun<CR>
xnoremap <Leader>r gv:<C-U>QuickRun<CR>

set t_Co=256
set background=dark
colorscheme iceberg

filetype plugin indent on
syntax enable
