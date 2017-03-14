# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.
#export LANG=en_US.UTF-8     #This is normally the case, however check .profile

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200

test -s ~/.alias && . ~/.alias || true

#To be sure which fortran compiler is presently loaded.
module unload fortran
module load fortran/intel/15.0
ifort -v

#Typical directory that I have recently worked
alias carbon='cd ~/Documents/Doktor/carbon/spectra_analysis/models'

#Startup file to be read when IDL is loaded
export IDL_STARTUP=/home/moon/luiz/idlproc/startup.pro

#Include present directory in PATH
export PATH=$PATH:.

#Some alias to type as less as possible

#alias +='pushd .'
#alias -='popd'
                #which is a program which shows the full path of (shell) commands
alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'   

alias beep='echo -en "\007"'

alias l='ls -alF'
alias la='ls -la'
alias ll='ls -l --color=auto'
alias ln='ln -i'
alias l.='ls -d .* --color=auto'

alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias gm='gvim'
alias gr='gvim -R'

alias acr='acroread' 
alias mkr='mkdir'  

alias ild='idl'   #open idl even when typo was made
alias lid='idl'
alias ldi='idl'

alias lss='less -JNIQ' #(J-status column, N-number of lines, I-ignorecase, Q-quiet)
alias o='less -JNIQ'
alias mr='more'

alias mv='mv -i'  #ask for confirmation if overwriting'
alias cp='cp -i' 
alias ln='ln -i'

alias .1='cd ..' 
alias .2='cd ../../' 
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias c="clear"

alias rehash='hash -r'
alias unmount='echo "Error: Try the command: umount" 1>&2; false'
alias you='if test "$EUID" = 0 ; then /sbin/yast2 online_update ; else su - -c "/sbin/yast2 online_update" ; fi'

# alias for the use of GIT
#s="git status -s"
#
#a=add
#ap=add -p
#
#c=commit --verbose
#ca=commit -a --verbose
#cm=commit -m
#cam=commit -a -m
#m=commit --amend --verbose
#
alias d=diff
#ds=diff --stat
#dc=diff --cached
#
#s=status -s
#
#co=checkout
#cob=checkout -b
#alias in form of functions
mcd() { mkdir -p "$1"; cd "$1";}  #Make a directory and cd into it in one command: mcd name
cls() { cd "$1"; ls;}  #cd into a directory and list its content: cls name.

#make command line smaller:
#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u:\W\$ '
#fi
#or
#export PS1='$(whoami):${PWD/*\//}> '
export PS1='\[\033[0;36m\]\A\[\033[1;30m\] $(whoami):${PWD/*\//}> '
#export PS1='$(whoami)@\h:${PWD/*\//}> '
#This last one is really complex and Ive set just for educacional propose (an example):
#export PS1="\[\033[s\033[0;0H\033[0;41m\033[K\033[1;33m\t\033[0m\033[u\]<\u@\h \W>\$ "

# Ignore duplicates in command history and increase
# history size to 1000 lines
export HISTCONTROL=ignoredups
export HISTSIZE=1000
