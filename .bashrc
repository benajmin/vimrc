# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PROMPT_COMMAND='case $PWD in
        $HOME) HPWD="~";;
        $HOME/*/*) HPWD="${PWD#"${PWD%/*/*}/"}";;
        $HOME/*) HPWD="~/${PWD##*/}";;
        /*/*/*) HPWD="${PWD#"${PWD%/*/*}/"}";;
        *) HPWD="$PWD";;
      esac
export PS1="\[\033[35m\]\u:\[\033[36m\]$HPWD\033[31m\]\$(parse_git_branch)\[\033[00m\] $ ";'
# Single directory version of prompt
# export PS1="\[\033[35m\]\W\[\033[31m\]\$(parse_git_branch)\[\033[00m\] $ "

export CLICOLOR=1
LSCOLORS=exfxcxdxbxegedabagacad
alias ccat='pygmentize -g -O style=colorful,linenos=1'

export VISUAL=vim
export EDITOR="$VISUAL"
