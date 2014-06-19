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

PATH=$PATH:$HOME/bin

export PATH
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

if [ -d $HOME/.phpenv ]; then
  export PATH="$HOME/.phpenv/bin:$PATH"
  eval "$(phpenv init -)"
fi

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
