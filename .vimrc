set nocompatible
filetype off

syntax on
" 行番号を表示
set number
" ルーラー表示
set ruler
" カーソルラインを表示
set cursorline
" 文字コードの指定
set encoding=utf-8
" タブで空白文字
set expandtab
" オートインデント
set smartindent
" シフト移動幅
set shiftwidth=2
" shiftwidthの数だけインデント
set smarttab
" 検索が末尾行ったら先頭から
set wrapscan
" Unicodeで行末が変になる問題対策
set ambiwidth=double

" 行末の空白を除去
autocmd BufWritePre * :%s/\s\+$//e

" =================
" |neobundle
" =================

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'https://github.com/scrooloose/nerdtree.git'
NeoBundle 'https://github.com/vim-scripts/AutoComplPop.git'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'evidens/vim-twig'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'wakatime/vim-wakatime'
call neobundle#end()

let g:syntastic_mode_map = { 'mode': 'passive',
            \ 'active_filetypes': ['ruby','javascript', 'haml', 'slim'] }
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_haml_checkers = ['haml_lint']
let g:syntastic_slim_checkers = ['slimrb']

filetype plugin indent on

" NERDTreeの起動をF7に設定
nmap <F7> :NERDTreeToggle
" ファイルを指定しない場合にNERDTree起動
let file_name = expand("%")
if has('vim_starting') && file_name == ""
  autocmd VimEnter * NERDTree ./
endif

" file exec
function! ExecuteCurrentFile()
  if &filetype == 'php' || &filetype == 'ruby'
    execute '!' . &filetype . ' %'
  endif
endfunction
nnoremap <Space> :call ExecuteCurrentFile()<CR>
