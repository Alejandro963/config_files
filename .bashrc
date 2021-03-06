# ~/.bashrc: executed by bash(1) for non-login shells.  # see /usr/share/doc/bash/examples/startup-files (in the package bash-doc) # for examples

export EDITOR=vim
export VISUAL=vim
export LANGUAGE=en

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

#
PROMPT_COMMAND='history -n;history -a'

#
export HISTTIMEFORMAT="%F %T "

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

# uncomment for a colored prompt, if the terminal has the capability; turned # off by default to not distract the user: the focus in a terminal window # should be on the output of commands, not on the prompt #force_color_prompt=yes if [ -n "$force_color_prompt" ]; then if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then # We have color support; assume it's compliant with Ecma-48 # (ISO/IEC-6429). (Lack of such support is extremely rare, and such # a case would tend to support setf rather than setaf.) color_prompt=yes else color_prompt= fi fi 
#if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
    #PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    #;;
#*)
    #;;
#esac
# git parse functions: thanks https://github.com/sferik/dotfiles/blob/master/bashrc
function parse_git_deleted {
  [[ $(git status 2> /dev/null | grep deleted:) != "" ]] && echo '-'
}
function parse_git_added {
  [[ $(git status 2> /dev/null | grep "Untracked files:") != "" ]] && echo '+'
}
function parse_git_modified {
  [[ $(git status 2> /dev/null | grep modified:) != "" ]] && echo '*'
}
function parse_git_dirty {
  # [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "☠"
  echo "$(parse_git_added)$(parse_git_modified)$(parse_git_deleted)"
}
function parse_git_branch {
  echo "$(parse_git_dirty)$(__git_ps1 '%s')"
}


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'

    PS1="\[\033[00;34m\]\u@\h\[\033[00m\] \[\033[00;37m\][\$rvm_env_string]:\[\033[00;36m\] \w\[\033[00m\] \$(parse_git_branch)\n\[\033[00m\]\$ "
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

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
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# alias AEB
alias finan='cd ~/web/finan'
alias one='cd ~/Ubuntu\ One'
alias rls='cd ~/rails'
alias wip='cd ~/rails/rfinan/'
alias dropbox='dropbox start -i'
alias rmsw='find -name "*.sw?" -delete'
alias t="tree -L $1"
# Navigation
alias ..='cd ..'
alias ...='cd .. ; cd ..'
alias h='cd ~'
alias c='clear'
# RAILS 3
alias rs='rails server'
alias rc='rails console'
alias rg='rails generate'
alias rp='rails plugin install'
#alias ano="annotate -p before -m -s -e test -e fixtures"
## Pipe Aliases (Global)
#alias -g L='|less'
#alias -g G='|grep'
#alias -g T='|tail'
#alias -g H='|head'
#alias -g W='|wc -l'
#alias -g S='|sort'

source ~/config_files/.git-completion.bash
source ~/config_files/.git-flow-completion.bash

# Completion from https://github.com/suborx/dotfiles/blob/master/.bashrc
bind "set completion-ignore-case on" # note: bind used instead of sticking these in .inputrc
bind "set show-all-if-ambiguous On" # show list automatically, without double tab
bind "set bell-style none" # no bell

PATH=$PATH:$HOME/.rvm/bin:/home/alejandro/Programas/phantomjs/bin # Add RVM to PATH for scripting
[[ -s "/home/alejandro/.rvm/scripts/rvm" ]] && source "/home/alejandro/.rvm/scripts/rvm"

[ -z "$TMUX" ] && export TERM=xterm-256color

function git_diff() {
  git diff --no-ext-diff -w "$@" | vim -R -
}

#
# http://dieter.plaetinck.be/per_directory_bash_history
#
# Usage: mycd <path>
#
#  Replacement for builtin 'cd', which keeps a separate bash-history
#   for every directory.
function mycd()
{
   history -w # write current history file
   builtin cd "$@" # do actual cd
   local HISTDIR="$HOME/.dir_bash_history$PWD" # use nested folders for history
   if  [ ! -d "$HISTDIR" ]; then # create folder if needed
      mkdir -p "$HISTDIR"
   fi
   export HISTFILE="$HISTDIR/bash_history.txt" # set new history file
   history -c  # clear memory
   history -r # read from current histfile
}
#hgrep (){ find ~/.dir_bash_history/ -type f|xargs grep -h $*;}
hgrep (){ find ~/.dir_bash_history/ -type f|xargs grep $*;}
#shopt -s histappend
#alias cd="mycd"
#export HISTFILE="$HOME/.dir_bash_history$PWD/bash_history.txt"
