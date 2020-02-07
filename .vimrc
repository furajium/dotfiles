set nocompatible
filetype off

inoremap <silent> jj <ESC>

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
" |dein
" =================

let s:dein_config_dir = $XDG_CONFIG_HOME . '/nvim'
let s:dein_cache_dir = $XDG_CACHE_HOME . '/dein'

if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=$XDG_CACHE_HOME/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(s:dein_cache_dir)
  call dein#begin(s:dein_cache_dir)

  call dein#load_toml(s:dein_config_dir . '/dein.toml', {'lazy': 0})
  call dein#load_toml(s:dein_config_dir . '/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

" file exec
function! ExecuteCurrentFile()
  if &filetype == 'php' || &filetype == 'ruby'
    execute '!' . &filetype . ' %'
  endif
endfunction
nnoremap <Space> :call ExecuteCurrentFile()<CR>
