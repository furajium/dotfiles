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
" |dein
" =================
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  call dein#add('scrooloose/nerdtree')
  call dein#add('scrooloose/syntastic')
  call dein#add('slim-template/vim-slim')
  call dein#add('leafgarland/typescript-vim')

  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif

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
