#!/bin/bash
. bin/util.sh

function symbolic_link() {
    backup $1 $2
    if [[ is_wsl && $(wslpath -w $(dirname $2)) != *"wsl.localhost"* ]]; then
        # WSLの場合、Powershellを使ってWindows側からシンボリックリンクを貼る
        src_path=$(wslpath -w $1)
        src_dir=$(dirname $1 | xargs wslpath -w)
        dst_path="$(wslpath -w $(dirname $2))/$(basename $2)"

        command="'-command \"cd \\\"$src_dir\\\";New-Item -ItemType SymbolicLink -Target \\\"$src_path\\\" -Path \\\"$dst_path\\\"\"'"
        powershell.exe -command start-process powershell -verb runas $command
    else
        ln -s $1 $2
    fi
}

if is_wsl; then
    user_path="$(wslpath "$(wslvar USERPROFILE)")/AppData/Roaming/Code/User/"
else
    echo unsupported $(get_os)
    user_path=
    return 0
fi

symbolic_link "vscode/settings.json" "${user_path}settings.json"
symbolic_link "vscode/keybindings.json" "${user_path}keybindings.json"
