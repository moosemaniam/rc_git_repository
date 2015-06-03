# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

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
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
   # PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

export PS1="\u \d \w \n> "
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

export CVSROOT=":ext:vikasmk@192.168.0.199:/repo/cvsroot"
export HEXAGON_TOOLS_ROOT="~/tools/Qualcomm/HEXAGON_Tools/5.0.08"
export PATH=$PATH:/home/vikas/sne_tools/bin/
export PATH=$PATH:/home/vikas/scripts
export PATH=$PATH:/home/vikas/aloa-4.6.0/tools
export PATH=$PATH:/home/vikas/lint/
export PATH=$PATH:/home/vikas/lint/lnt
export INPUTDIR="/home/vikas/projects/test_vectors"
export BACKUP_DIR="/home/vikas/projects/BACKUP"
export PATH=$PATH:/home/vikas/tools/Gnu-arm-toolchain/install/bin
export PATH=$PATH:/home/vikas/tools/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/bin/
export PATH=$PATH:/usr/local/DS-5/bin
export PATH=$PATH:/home/vikas/Downloads/gcc-linaro-arm-linux-gnueabihf-4.9-2014.06_linux/bin
export PATH=$PATH:/opt/ti-sdk-am335x-evm-07.00.00.00/linux-devkit/sysroots/i686-arago-linux/usr/bin
export PATH=$PATH:/home/vikas/bin
export PATH=$PATH:/opt/freescale/usr/local/gcc-4.6.2-glibc-2.13-linaro-multilib-2011.12/fsl-linaro-toolchain/arm-fsl-linux-gnueabi/bin/
export PATH=$PATH:/opt/freescale/usr/local/gcc-4.6.2-glibc-2.13-linaro-multilib-2011.12/fsl-linaro-toolchain/bin/
export PATH=$PATH:/home/vikas/tools/Qualcomm/HEXAGON_Tools/5.0.08/gnu/bin
export PATH=$PATH:~/tools/Qualcomm/HEXAGON_Tools/5.0.08/qc/bin/
export PATH=$PATH:/home/vikas/tools/yuvit/build/src
export PATH=$PATH:$PWD
if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
	    export TERM=gnome-256color
fi

alias back=". back"
alias svn_clean="svn status --no-ignore | grep '^[?I]' | xargs rm -rf"
alias janatha="nautilus smb://192.168.0.99"
alias sinstall="sudo apt-get install"
alias linlint="wine /home/vikas/lint/lint-nt.exe"
export PCLINT_PATH="/home/vikas/lint"
alias gstat="git status ."
alias gdiff="git difftool "
alias gadd="git add"
alias gcom="git commit"
export SD="/media/rootfs/home/sujata/vikasmk/"
alias tmux="tmux -2"
alias ddd="ddd -foreground GREEN -background BLACK"

alias svn_allgo_aacdec="export SVNROOT=svn+ssh://vikasmk@192.168.0.199/repo/svn/allgo/allgo_aacdec"
alias svn_wmadec="export SVNROOT=svn+ssh://vikasmk@192.168.0.11/repo/svn/allgo/wmadec_10"
alias neonobjdump="/home/vikas/tools/angstorm_tool_chain/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/bin/objdump"

set vb t_vb="."
# some more ls aliases
alias ll='ls -ltr'
alias la='ls -A'
alias l='ls -CF'
alias bc='bc -l'
alias maek='make'
alias pwav="pcm2wav -s 8000 -c 1"

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
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#Replace everything between brackets
#sed -e 's/\[[^][]*\]//g'