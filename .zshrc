autoload -U compinit
compinit

HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=100000
setopt extended_history
function history-all { history -E 1 }

alias s="git status"
alias d="git diff"
alias b="git branch"
alias l="git log --graph --date=short --decorate=short --pretty=format:'%Cgreen%h %Creset%cd %Cblue%cn %Cred%d %Creset%s'"
alias be="bundle exec"
alias grep="grep --color"

PATH=$PATH:$HOME/bin:/usr/local/heroku/bin:/usr/local/src/go/bin/

export PATH

[ ! -d $HOME/.rbenv ] && git clone git://github.com/sstephenson/rbenv.git ~/.rbenv && git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
if [ -d $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

if [ -d $HOME/.phpenv ]; then
  export PATH="$HOME/.phpenv/bin:$PATH"
  eval "$(phpenv init -)"
fi

[ ! -d $HOME/.pyenv ] && git clone git://github.com/yyuu/pyenv.git ~/.pyenv
if [ -d $HOME/.pyenv ]; then
    [ ! -d $HOME/.pyenv/plugins/pyenv-virtualenv ] && git clone git://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH=$PYENV_ROOT/bin:$PATH
    eval "$(pyenv init -)"
fi

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib

# 色設定
autoload -U colors; colors

# もしかして機能
setopt correct

# PCRE 互換の正規表現を使う
setopt re_match_pcre

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

# プロンプト指定
PROMPT="
[%n] %{${fg[yellow]}%}%~%{${reset_color}%}
%(?.%{$fg[green]%}.%{$fg[blue]%})%(?!(๑¯Δ¯๑)/ <!(*;-;%)? <)%{${reset_color}%} "

# プロンプト指定(コマンドの続き)
PROMPT2='[%n]> '

# もしかして時のプロンプト指定
SPROMPT="%{$fg[red]%}%{$suggest%}(*'~'%)? < もしかして %B%r%b %{$fg[red]%}かな? [そう!(y), 違う!(n),a,e]:${reset_color} "
