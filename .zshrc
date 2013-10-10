# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="gentoo"
#ZSH_THEME="josh"
#ZSH_THEME="aussiegeek"
#ZSH_THEME="simonoff"
#ZSH_THEME="jonathan"
#ZSH_THEME="half-life"

#ZSH_THEME="Soliah"
#ZSH_THEME="3den"
#ZSH_THEME="fino"
#ZSH_THEME="murilasso"
ZSH_THEME="ale"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github git-flow cap gem zsh-syntax-highlighting bundler vi-mode rvm ale)
#plugins=(ale)


source $ZSH/oh-my-zsh.sh

bindkey -M viins \\C-R history-incremental-search-backward

# Customize to your needs...
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
#shopt -s histappend
fc -W

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
#shopt -s checkwinsize

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

unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
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
alias -g L='|less'
alias -g G='|grep'
alias -g T='|tail'
alias -g H='|head'
alias -g W='|wc -l'
alias -g S='|sort'

unsetopt auto_name_dirs
rvm_project_rvmrc=1
PATH=$PATH:$HOME/.rvm/bin:/home/alejandro/Programas/phantomjs/bin # Add RVM to PATH for scripting
[[ -s "/home/alejandro/.rvm/scripts/rvm" ]] && source "/home/alejandro/.rvm/scripts/rvm"
unset RUBYOPT
#cd . # to rvm reload

[ -z "$TMUX" ] && export TERM=xterm-256color

function git_diff() {
  git diff --no-ext-diff -w "$@" | vim -R -
}

