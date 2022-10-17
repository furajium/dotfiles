#!/bin/sh
cd $(dirname $0)
for dotfile in .?*; do
  if [ $dotfile != '..' ] && [ $dotfile != '.git' ] && [ $dotfile != '.gitignore' ] && [ $dotfile != '.config' ]
  then
    ln -Fis "$PWD/$dotfile" $HOME
  fi
done

[ ! -d $HOME/.config ] && mkdir $HOME/.config
[ ! -d $HOME/.config/nvim ] && mkdir $HOME/.config/nvim
if [ ! -d $HOME/.cache/dein ]
then
  # install dein
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
  # For example, we just use `~/.cache/dein` as installation directory
  sh ./installer.sh $HOME/.cache/dein
  rm ./installer.sh
fi

ln -is $HOME/.vimrc $HOME/.config/nvim/init.vim
ln -is $PWD/.config/nvim/dein.toml $HOME/.config/nvim/dein.toml
ln -is $PWD/.config/nvim/dein_lazy.toml $HOME/.config/nvim/dein_lazy.toml
ln -is $PWD/.config/starship.toml $HOME/.config/starship.toml

[ ! -d $HOME/.config/git ] && mkdir $HOME/.config/git
ln -is $PWD/.config/git/ignore $HOME/.config/git/ignore
