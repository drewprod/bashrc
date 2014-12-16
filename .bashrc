# Default debian 6
[ -z "$PS1" ] && return

HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
HISTCONTROL=ignoreboth

shopt -s histappend
shopt -s checkwinsize

if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# my bash setting
if [[ $EUID -ne 0 ]]; then
	PS1="\[\e[00;37m\]\u\[\e[0m\]\[\e[00;31m\]@\[\e[0m\]\[\e[00;37m\]\h \[\e[0m\]\[\e[00;31m\]:\[\e[0m\]\[\e[00;37m\] \w\n\[\e[0m\]\[\e[00;32m\]\\$\[\e[0m\]\[\e[00;37m\] \[\e[0m\]"
else
	PS1="\[\e[00;37m\]\u\[\e[0m\]\[\e[00;31m\]@\[\e[0m\]\[\e[00;37m\]\h \[\e[0m\]\[\e[00;31m\]:\[\e[0m\]\[\e[00;37m\] \w\n\[\e[0m\]\[\e[00;31m\]\\$\[\e[0m\]\[\e[00;37m\] \[\e[0m\]"
fi

export PS1
