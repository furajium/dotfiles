#!/bin/sh
cd $(dirname $0)
for dotfile in .?*; do
  if [ $dotfile != '..' ] && [ $dotfile != '.git' ] && [ $dotfile != '.gitignore' ]
  then
    ln -Fis "$PWD/$dotfile" $HOME
  fi
done

# php 辞書ファイル
php -r '$f=get_defined_functions();echo join("\n",$f["internal"]);'|sort > ~/.vim/dict/php.dict

# NeoBundleInstall
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
vim +NeoBundleInstall +qall
