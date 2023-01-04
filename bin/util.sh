#!/bin/bash

readonly OS_MAC="Mac"
readonly OS_LINUX="Linux"
readonly OS_WSL="WSL"

# シェル実行時のOSの取得
function get_os() {
  case "$(uname)" in
  'Darwin') echo $OS_MAC ;;
  'Linux')
    if [[ "$(uname -r)" == *WSL* ]]; then
      echo $OS_WSL
    else
      echo $OS_LINUX
    fi
    ;;
  esac
}

function is_os() {
  test "$(get_os)" == "$1"
}

function is_mac() {
  is_os $OS_MAC
}

function is_linux() {
  is_os $OS_LINUX
}

function is_wsl() {
  is_os $OS_WSL
}

function backup() {
  if [ -L $2 ]; then
    rm $2
  elif [ -e $2 ]; then
    backup_dir="backup/$(dirname $1)"
    mkdir -p $backup_dir
    mv $2 backup_dir
  fi
}
