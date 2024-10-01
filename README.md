# dotfiles

[chezmoi](https://www.chezmoi.io/reference/)

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin
```

initialize

```bash
chezmoi init git@github.com:showa-93/dotfiles.git

./bin/install.sh
export BW_SESSION=$(bw unlock --raw)
chezmoi apply

# bash-itの導入
sudo apt install unzip
sudo apt install -y language-pack-en
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh
curl -s https://ohmyposh.dev/install.sh | bash -s

# フォントのインストール
Powershell.exe -Command winget install JanDeDobbeleer.OhMyPosh
oh-my-posh font install
# select Mesro
# Set MesroLGM Nerd Font
```

## WSLでchezmoi使うとき

<https://github.com/microsoft/WSL/issues/10552#issuecomment-1738285558>  

```code
sudo systemctl disable --now systemd-networkd.service
```

## 更新したら

```bash
export BW_SESSION=$(bw unlock --raw)
chezmoi apply
```
