source ~/.bash_completion/todo_completion
alias todo=todo.sh
complete -F _todo todo

todo_count () {
    local line_count=$(todo ls | wc -l);
    local todo_items=$(($line_count - 2));
    if (( $todo_items > 0 )); then
        echo "(TODO: $todo_items)"
    else
        echo
    fi
};

PS1='\[\033[33m\]\w\[\033[36m\]`__git_ps1` \[\033[32m\]`todo_count` \[\033[0m\] \n=>> ' 
