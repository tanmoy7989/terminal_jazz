## COLOR SUPPORT
export TERM=xterm-256color

# color prompt and titlebar
export PS1="\[\e[36;1m\]\@ \[\e[33;1m\]\h\[\e[32;1m\]\w> \[\e[0m\]"

# color dir listing
OS='uname -s'
case "$OS" in 
    "Darwin"|"FreeBSD")
        export CLICOLOR=1
        export LSCOLORS=ExFxCxDxBxegedabagacad
        alias ls='ls -l'
        ;;
    "Linux")
        DIR_COLORS="./dircolors"
        eval "`dircolors -b $DIR_COLORS`"
        alias ls='ls --color=auto -X -ohFrt'
        alias dir='ls --color=auto --format=vertical -X'
        ;;
esac

# color searches
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'

# color man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'                           
export LESS_TERMCAP_so=$'\E[01;44;33m'                                 
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

## BASH HISTORY
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=1000000
HISTFILESIZE=2000000
shopt -s histappend
export HISTTIMEFORMAT="%F %T "

## PATHS
#VMD
alias vmd='/Applications/VMD\ 1.9.3.app/Contents/MacOS/startup.command'
# LaTeX
export PATH=$PATH:/Library/TeX/texbin
export PYTHONPATH=$PYTHONPATH:/Library/TeX/texbin # need this for latex rendering in matplotlib

## REMOTE SERVERS
# ssh routes
alias zin='ssh tsanyal@zin.cnsi.ucsb.edu -X'
# jupyter-notebook server on the cluster
alias fwdjupyter='ssh -N -L localhost:8888:localhost:8889 tsanyal@zin.cnsi.ucsb.edu'
# remote mounts
alias mountzin='sshfs tsanyal@zin.cnsi.ucsb.edu:/home/cask0/home/tsanyal ~/zin -o defer_permissions -o volname=zin'

# ALIASES
alias bashedit='vim ~/.bashrc'
alias vimedit='vim ~/.vimrc'

## FUNCTIONS
# file extraction
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }

#print specific column of pipe ex | fawk 2
function fawk {
    first="awk '{print "
    last="}'"
    cmd="${first}\$${1}${last}"
    eval $cmd
}

# added by Anaconda2 5.3.1 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/tsanyal/anaconda2/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/tsanyal/anaconda2/etc/profile.d/conda.sh" ]; then
        . "/Users/tsanyal/anaconda2/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/tsanyal/anaconda2/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
