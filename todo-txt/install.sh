function add_to_config {
    grep -qxF "$1" ~/.bashrc || echo $1 >> ~/.bashrc 
}

# Download release
$(gh api repos/todotxt/todo.txt-cli/releases/latest | jq '.assets[] | select(.content_type=="application/zip") | .browser_download_url' | xargs echo curl -k -L --output todo-txt.zip)

# Extract zip
unzip -j todo-txt.zip -d todo-txt 
rm todo-txt.zip

# Copy sh file to bin
mkdir ~/bin -p
cp todo-txt/todo.sh ~/bin

# Copy config
mkdir ~/.todo -p
cp todo-txt/todo.cfg ~/.todo/config

# Add completion
mkdir ~/.bash_completion -p
cp todo-txt/todo_completion ~/.bash_completion/
add_to_config 'source ~/.bash_completion/todo_completion'

# Alias todo.sh to todo
add_to_config "alias todo=todo.sh"
add_to_config "complete -F _todo todo"

# Cleanup
rm -rf todo-txt

# Reload shell
exec $SHELL
