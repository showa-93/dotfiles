#!/bin/bash

# WSL2上のファイルに対してPowershellを使ってWindows側からSymbolicLinkを貼る
function symbolic_link() {
    if [ -L $2 ]; then
        rm $2
        echo "removed symbolic link"
    else
        backup_dir="backup/$(dirname $1)"
        mkdir -p $backup_dir
        mv $2 backup_dir
        echo "move from $2 to $backup_dir"
    fi

    src_path=$(wslpath -w $1)
    src_dir=$(dirname $1 | xargs wslpath -w)
    target=$(wslpath -w $2)

    command="'-command \"cd \\\"$src_dir\\\";New-Item -ItemType SymbolicLink -Target \\\"$src_path\\\" -Path \\\"$target\\\"\"'"
    powershell.exe -command start-process powershell -verb runas $command
}

symbolic_link "vscode/settings.json" "/mnt/c/Users/shoma/AppData/Roaming/Code/User/settings.json"
symbolic_link "vscode/keybindings.json" "/mnt/c/Users/shoma/AppData/Roaming/Code/User/keybindings.json"
