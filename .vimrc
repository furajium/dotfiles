set nocompatible
filetype off

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

" =================
" |neobundle 
" =================

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#rc(expand('~/.vim/bundle'))

" My Bundles here:
NeoBundle 'https://github.com/scrooloose/nerdtree.git'
NeoBundle 'https://github.com/vim-scripts/AutoComplPop.git'

filetype plugin indent on

" NERDTreeの起動をF7に設定
nmap <F7> :NERDTreeToggle
" ファイルを指定しない場合にNERDTree起動
let file_name = expand("%")
if has('vim_starting') &&  file_name == ""
  autocmd VimEnter * NERDTree ./
endif

