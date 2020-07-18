include () {
    test -f "$1" && source "$1"
} 

# Aliases
alias cypress=node_modules/.bin/cypress $*
alias ls='ls --color=auto'
alias tf=terraform $*
alias todo=todo.sh

# Disable certificate verification
cert=/c/certs/forcepoint_root_cert.crt
set AZURE_CLI_DISABLE_CONNECTION_VERIFICATION=0
test -f $cert && set NODE_EXTRA_CA_CERTS=$cert

# Auto-complete
include "/c/Program Files/Git/usr/etc/bash_completion.sh"
include ~/.bash_completion/todo_completion
complete -F _todo todo

# Remote Desktop
alias remote="mstsc.exe /w 1715 /h 1405 /v $*"
set RDP_WIDTH=1715
set RDP_HEIGHT=1405

# Git
export GIT_PS1_SHOWDIRTYSTATE=1

# Get count of remaining todo items for prompt
todo_count () {
    local line_count=$(todo ls | wc -l);
    local todo_items=$(($line_count - 2));
    if (( $todo_items > 0 )); then
        echo "(TODO: $todo_items)"
    else
        echo
    fi
};

PS1='\n\[\033[33m\]\w\[\033[36m\]`__git_ps1` \[\033[0m\] \n=>> ' 
