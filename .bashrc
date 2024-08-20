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

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
# export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# some custom aliases
# ANSI color codes

alias temp-watch='~/scripts/cpuTemperatureWatch'
alias power-process='~/scripts/processPowerUsage'
# PS1="\[$(tput setaf 13)\]\u\[$(tput setaf 21)\]@\[$(tput setaf 160)\]\h \[$(tput setaf 13)\]\w \[$(tput sgr0)\]$ "
# export PS1="\[\e[38;5;13m\]\u\[\e[38;5;21m\]@\[\e[38;5;160m\]\h \[\e[38;5;13m\]\w \[\033[0m\]$ "
# export PS1="\[\e[38;5;165m\]\u\[\e[38;5;171m\]@\[\e[38;5;213m\]\h \[\e[38;5;219m\]\w \[\033[0m\]$ "
# export PS1="\[\e[38;5;171m\]\u\[\e[38;5;21m\]@\[\e[38;5;13m\]\h \[\e[38;5;171m\]\w \[\033[0m\]$ "
export PS1="\[\e[38;5;213m\]\u\[\e[38;5;13m\]@\[\e[38;5;213m\]\h \[\e[38;5;13m\]\w \[\033[38;5;141m\]\$\[\033[0m\] "

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

LS_COLORS="rs=0:di=01;35:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;31:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=00;33:*.jpeg=00;33:*.mjpg=00;33:*.mjpeg=00;33:*.gif=00;33:*.bmp=00;33:*.pbm=00;33:*.pgm=00;33:*.ppm=00;33:*.tga=00;33:*.xbm=00;33:*.xpm=00;33:*.tif=00;33:*.tiff=00;33:*.png=00;33:*.svg=00;33:*.svgz=00;33:*.mng=00;33:*.pcx=00;33:*.mov=00;33:*.mpg=00;33:*.mpeg=00;33:*.m2v=00;33:*.mkv=00;33:*.webm=00;33:*.webp=00;33:*.ogm=00;33:*.mp4=00;33:*.m4v=00;33:*.mp4v=00;33:*.vob=00;33:*.qt=00;33:*.nuv=00;33:*.wmv=00;33:*.asf=00;33:*.rm=00;33:*.rmvb=00;33:*.flc=00;33:*.avi=00;33:*.fli=00;33:*.flv=00;33:*.gl=00;33:*.dl=00;33:*.xcf=00;33:*.xwd=00;33:*.yuv=00;33:*.cgm=00;33:*.emf=00;33:*.ogv=00;33:*.ogx=00;33:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:"
