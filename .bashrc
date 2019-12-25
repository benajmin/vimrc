# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[35m\]\W\[\033[31m\]\$(parse_git_branch)\[\033[00m\] $ "

export CLICOLOR=1
LSCOLORS=exfxcxdxbxegedabagacad
alias ccat='pygmentize -g -O style=colorful,linenos=1'
