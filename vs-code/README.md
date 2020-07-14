# VS Code

All commands are to be executed from this directory

## Import

### Extensions

``` bash
./install-extensions.sh
```

### Settings

``` bash
cp settings.json $APPDATA/Code/User
```

## Export

### Extensions

``` bash
code --list-extensions | xargs -L 1 echo code --install-extension > install-extensions.sh
```

### Settings

``` bash
cp $APPDATA/Code/User/settings.json .
```
