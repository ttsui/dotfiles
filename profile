alias pgrep='pgrep -af'
alias rm='rm -i'
alias grep='grep --color'
alias ..='cd ..'
alias less='less -S'
alias df='df -h'

if [ -d /usr/local/etc/bash_completion.d/ ]; then
        . /usr/local/etc/bash_completion.d/git-completion.bash
        . /usr/local/etc/bash_completion.d/git-prompt.sh

    PROMPT_COMMAND='__git_ps1 "[\D{%F %R} \W]" "\\\$ "'
    GIT_PS1_SHOWCOLORHINTS=yes
    GIT_PS1_SHOWDIRTYSTATE=yes
fi
