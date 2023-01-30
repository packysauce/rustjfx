# shellcheck shell=bash
# # ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

HISTSIZE=1000
HISTFILESIZE=2000
HISTTIMEFORMAT="%F %T : "
HISTCONTROL=ignoredups:ignorespace

# history tweaks
shopt -s histappend histreedit histverify
# pasted command helpers lawl
shopt -s cmdhist lithist

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# support bad spellers (read: fast typers)
shopt -s dirspell cdspell
# glob improvements
shopt -s extglob globstar failglob

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

PS1='\[\033[01;34m\]\w\[\033[00m\]\$ '

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='rg --color=auto'
    alias fgrep='rg --color=auto -f'
    alias egrep='rg --color=auto -e'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Load in rust environment
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

export EDITOR=code
