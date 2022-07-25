[[ -e ~/.bashrc  ]] && source ~/.bashrc     # load aliases etc.

alias pgrep='pgrep -af'
alias rm='rm -i'
alias grep='grep --color'
alias ..='cd ..'
alias less='less -S'
alias df='df -h'
alias ls='ls -G'
alias ll='ls -Gl'
alias dchost='docker run -it --privileged --pid=host ubuntu nsenter -t 1 -m -u -n -i sh'
alias dc='cd ~/Source/gc/provisioning/ && docker-compose'
#alias ecr-login='aws ecr get-login-password | docker login --username AWS --password-stdin 602223103101.dkr.ecr.ap-southeast-2.amazonaws.com'

dev-redis-commander() {
  local REDIS_PORT=${1:-6379}
  docker run --rm --name redis-commander \
    --env REDIS_HOSTS=queues-redis:host.docker.internal:6379,storage-redis:host.docker.internal:16379 \
    -p 8081:8081   rediscommander/redis-commander:latest
}

redis-commander() {
  local REDIS_PORT=${1:-6379}
  docker run --rm --name redis-commander \
    --env REDIS_HOSTS=localhost:host.docker.internal:${REDIS_PORT} \
    -p 8081:8081   rediscommander/redis-commander:latest
}

if [ -d /usr/local/etc/bash_completion.d/ ]; then
        . /usr/local/etc/bash_completion
        . /usr/local/etc/bash_completion.d/git-completion.bash
        . /usr/local/etc/bash_completion.d/git-prompt.sh

    PROMPT_COMMAND='__git_ps1 "[\D{%F %R} \W]" "\\\$ "'
    GIT_PS1_SHOWCOLORHINTS=yes
    GIT_PS1_SHOWDIRTYSTATE=yes
fi

# Setting PATH for Python 2.7
# The original version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
export DOCKER_ANSIBLE=yes
export APP_ENV=test

export PATH="$HOME/bin:$PATH"
export PATH="$PATH:$(ruby -e 'puts Gem.bindir')"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="$PATH:$HOME/Library/Python/3.8/bin/"
export COMPOSE_HTTP_TIMEOUT=600
export BUILD_NUMBER=dev

export PATH=/usr/local/lib/ruby/gems/3.0.0/bin:${PATH}
