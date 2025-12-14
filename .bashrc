alias secuway-restart="source ~/.local/bin/U2.0_linux_client/SSU20-CFL-V2.0.0.3/restart.sh"
PS1='\[\e[01;32m\]\u@\h\[\e[00m\]:\[\e[01;34m\]\w\[\e[00m\]\$ '
alias ll="ls -AhvolF --color=auto --group-directories-first"
alias grep="grep --color=auto"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Directories
alias projects="cd $HOME/Projects"
alias dotfiles="cd $HOME/.dotfiles"

alias notes="vim $HOME/notes.txt"

export LC_ALL="en_US.UTF-8"

# Unlimited bash history
export HISTFILESIZE=32768
export HISTSIZE=32768
export HISTCONTROL=ignoreboth

export PATH=$PATH:$HOME/.local/bin

. "$HOME/.cargo/env"

eval "$(starship init bash)"
