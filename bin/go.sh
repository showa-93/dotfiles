#!/bin/bash
# https://go.dev/doc/install

# Goの最新バージョンをとってくる
version=1.0.0
minor_version=0
patch_version=0
BK_IFS=$IFS
IFS=, semantic=(${version//./,})
i=0
while : ; do
  ((i++))
  body=$(curl -s https://api.github.com/repos/golang/go/tags?page=${i})
  IFS=${BK_IFS} versions=($(echo "$body" | jq -r .[].name))
  if [ ${#versions[@]} -eq 0 ]; then
    break
  fi

  for full_version in ${versions[@]}; do
    cur_version=$(echo "$full_version" | sed -E 's/^go(1\.[0-9]{2}\.[0-9]{1,2})$/\1/')
    # go1.xx.xx以外のバージョンを弾く
    if [ $cur_version == $full_version ]; then
      continue
    fi

    # マイナーバージョンとパッチバージョンを確認して最新を取得する
    IFS=, cur_semantic=(${cur_version//./,})
    cur_minor=$(expr "${cur_semantic[1]}")
    cur_patch=$(expr "${cur_semantic[2]}")
    if [ $cur_minor -gt $minor_version ] || ([ $cur_minor -eq $minor_version ] && [ $cur_patch -gt $patch_version ]); then
      version=$cur_version
      minor_version=$cur_minor
      patch_version=$cur_patch
      continue
    fi
  done
done

echo -n "v${version}をインストールしてもよいか？(yes/no):"
read ans

if [[ $ans == "y" ]] || [[ $ans == "yes" ]]; then
  if is_linux || is_wsl; then
    wget https://golang.org/dl/go${version}.linux-amd64.tar.gz &&
      sudo rm -rf /usr/local/go &&
      sudo tar -C /usr/local -xzf go${version}.linux-amd64.tar.gz &&
      rm -r go${version}.linux-amd64.tar.gz
  fi
fi
