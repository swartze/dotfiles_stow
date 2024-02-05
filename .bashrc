#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set up Node Version Manager
source /usr/share/nvm/init-nvm.sh

# connect to ssh-agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

alias clr='clear'
alias ls='ls --color=auto'
alias vi='vim'
alias fr='trans -s fr'
alias en='trans -t fr'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/.git/ --work-tree=$HOME'
PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"
source /usr/share/nvm/init-nvm.sh

parse_git_branch() {
	git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u@\h \[\033[33m\]\$(parse_git_branch) \n \\[\033[32m\]\w\[\033[00m\] $ "

export VISUAL=nvim
export EDITOR="$VISUAL"

if [ -n "${NVIM_LISTEN_ADDRESS+x}" ]; then
	export MANPAGER="/usr/local/bin/nvr -c 'Man!' -o -"
fi

PATH="/home/lee/perl5/bin${PATH:+:${PATH}}"
export PATH
PERL5LIB="/home/lee/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL5LIB
PERL_LOCAL_LIB_ROOT="/home/lee/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_LOCAL_LIB_ROOT
PERL_MB_OPT="--install_base \"/home/lee/perl5\""
export PERL_MB_OPT
PERL_MM_OPT="INSTALL_BASE=/home/lee/perl5"
export PERL_MM_OPT
export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"

export PATH="$PATH:/home/lee/bin/"

eval "$(rbenv init - bash)"
