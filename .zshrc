autoload -U compinit
compinit

HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=100000
setopt extended_history
function history-all { history -E 1 }

alias vi="nvim"
alias ll="ls -l --color=auto"
alias s="git status"
alias d="git diff"
alias b="git branch"
alias l="git log --graph --date=short --decorate=short --pretty=format:'%Cgreen%h %Creset%cd %Cblue%cn %Cred%d %Creset%s'"
alias be="bundle exec"
alias grep="grep --color"

PATH=$HOME/bin:$HOME/.local/bin:/usr/local/heroku/bin:/usr/local/src/go/bin/:/usr/local/pgsql/bin:$PATH

export PATH

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache

eval "$(starship init zsh)"

[ ! -d $HOME/.anyenv ] && git clone https://github.com/riywo/anyenv ~/.anyenv
if [ -d $HOME/.anyenv ]; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"

  [ ! -d $HOME/.anyenv/plugins ] && git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
fi

[ ! -e $HOME/.git-prompt.sh ] && curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
if [ -e $HOME/.git-prompt.sh ]; then
  source $HOME/.git-prompt.sh
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
[%n]%{${fg[blue]}%}% \$(__git_ps1)%{${reset_color}%} %{${fg[yellow]}%}%~%{${reset_color}%}
%(?.%{$fg[green]%}.%{$fg[blue]%})%(?!(๑¯Δ¯๑)/ <!(*;Δ;%)? <)%{${reset_color}%} "

# プロンプト指定(コマンドの続き)
PROMPT2='[%n]> '

# もしかして時のプロンプト指定
SPROMPT="%{$fg[red]%}%{$suggest%}(*'~'%)? < もしかして %B%r%b %{$fg[red]%}かな? [そう!(y), 違う!(n),a,e]:${reset_color} "

export GIT_PS1_SHOWUPSTREAM=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWDIRTYSTATE=1

if [ -e $HOME/.private_config ]; then
  source $HOME/.private_config
fi
