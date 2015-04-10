# -----------------------------------------------------------------------
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything:
[ -z "$PS1" ] && return

# First, determine operating system
ostype=$(uname -s)
if [[ "${ostype:0:6}" == "Darwin" ]]; then
  os='Darwin'
else
  os='Linux'
fi
export $os

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profiles
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# ----------------------------------------------
# global (ALL environments and platforms)

# reset our path builder
ADD_TO_PATH=()

# default editor
export EDITOR=vim

# use Darwin MacVim if we have it
V=$(which mvim)
[[ $? -ne 0 ]] && V=$(which vim)

# -----------------------------------------------------------------------
# Quantum-specific stuff

export QUANTUM_HOME=$HOME/repo/quantum/home
alias janus-update="cd $HOME/.vim && rake && cd -"

# helpers
alias e="$V ~/.bashrc"
alias ep="$V ~/.bash_profile"
alias s="source ~/.bashrc"
alias sp="source ~/.bash_profile"

# -----------------------------------------------------------------------

# Add timestamps to bash history
HISTTIMEFORMAT='%Y-%m-%dT%T%Z '
# don't put duplicate lines or lines starting with space in the history.
histcontrol=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
histsize=1000
histfilesize=2000

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# ----------------------------------------------
# linux

if [[ "$os" == "Linux" ]]; then

  # put your linux-specific stuff here.

  # colors
  alias ls='ls --color'

  # ----------------------------------------------
  # host-specific stuff

  if [[ "$HOSTNAME" == "foo" ]]; then
    # do stuff specific to host named 'foo'
  fi
fi

# ----------------------------------------------
# darwin/mac

if [[ "$os" == "Darwin" ]]; then

  # put your darwin-specific stuff here

  # ---------------------------------------------------------------------
  # paths, you can include directories here that should be added to your path

  ADD_TO_PATH=($HOME/bin/osx /usr/local/sbin /usr/local/bin "${ADD_TO_PATH[@]}")

  # ls colors in darwin
  # Darwin = LSCOLORS
  export CLICOLOR=1

  # Useful aliases
  alias dns-flush='dscacheutil -flushcache'
  alias top-osx='top -o cpu -O vprvt'
fi

# ----------------------------------------------
# path builder
for each in $HOME/bin ${ADD_TO_PATH[@]} ; do
  [ -e $each ] && NEW_PATH=$NEW_PATH:$each
done
export PATH=$NEW_PATH:$PATH

# include your current directory in path
export PATH=.:${PATH}

# manpath builder
if [ -d ~/man ]; then
  MANPATH=~/man${MANPATH:-:}
  export MANPATH
fi

# put global stuff here, like your prompt settings, etc.

# EOF
