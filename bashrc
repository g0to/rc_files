# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# Aggregate history of all terminals in the same .history. On your .bashrc:
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTCONTROL=ignoredups:erasedups
export PROMPT_COMMAND="history -a;history -c;history -r;$PROMPT_COMMAND"
HISTTIMEFORMAT='%F %T %t'

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set the prompt
#PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
export PS1="\[$(tput setaf 2)\]\u@\h:\[$(tput bold)\]\w\[$(tput sgr0)\]\\$ \[$(tput sgr0)\]"

# If this is an xterm, set the title to user@host
case "$TERM" in
    xterm*|rxvt*)
        #PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h\a\]$PS1"
        export PS1="\[\e]0;\u@\h\a\]$PS1"
    ;;
    *)
    ;;
esac

# enable a wider color support for the terninal
export TERM=xterm-256color

# enable ls's color support
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# aliases
alias alarm='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias clipboard='xclip -selection c'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias less='less -i'
alias ls='ls -lhp --group-directories-first --color=auto'
alias youtube-dl-mp3='youtube-dl -x --audio-format mp3 --audio-quality 0'

# enable auto completion in bash
if [ -f /usr/local/etc/profile.d/bash_completion.sh ]; then
    . /usr/local/etc/profile.d/bash_completion.sh
fi

# build your own path
export PATH="~/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gawk/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

eval "$(pyenv init -)"

export EDITOR=vi
