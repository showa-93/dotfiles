# dotfiles

[chezmoi](https://www.chezmoi.io/reference/)

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin
```

initialize

```bash
chezmoi init git@github.com:showa-93/dotfiles.git
```

## WSLでchezmoi使うとき

<https://github.com/microsoft/WSL/issues/10552#issuecomment-1738285558>  

```code
sudo systemctl disable --now systemd-networkd.service
```
