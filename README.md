# dotfiles
Installation guide for Ubuntu

```sh
$ cd ~
$ mkdir .myconfig
$ cd .myconfig
$ git clone https://github.com/camembert-t/dotfiles.git
```

## fish

```sh
$ sudo apt-add-repository ppa:fish-shell/release-3
$ sudo apt-get update
$ sudo apt-get install fish
$ ln -s ~/.myconfig/dotfiles/fish/config.fish ~/.config/fish/config.fish
$ ln -s ~/.myconfig/dotfiles/fish/fishfile ~/.config/fish/fishfile
$ ln -s ~/.myconfig/dotfiles/fish/fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish
```
https://github.com/fish-shell/fish-shell

## neovim
