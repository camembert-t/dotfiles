# dotfiles
Installation guide for Ubuntu

```sh
$ mkdir ~/.myconfig 
$ mkdir ~/.myconfig/dotfiles
$ git clone https://github.com/camembert-t/dotfiles.git ~/.myconfig
```


## fish

```sh
$ sudo apt-add-repository ppa:fish-shell/release-3
$ sudo apt-get update
$ sudo apt-get install fish
$ chsh $USER -s $(which fish)
$ ln -s ~/.myconfig/dotfiles/fish/config.fish ~/.config/fish/config.fish
$ ln -s ~/.myconfig/dotfiles/fish/fishfile ~/.config/fish/fishfile
$ ln -s ~/.myconfig/dotfiles/fish/fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish
```
- https://github.com/fish-shell/fish-shell


## neovim

```sh
$ sudo apt-get install software-properties-common
$ sudo add-apt-repository ppa:neovim-ppa/stable
$ sudo apt-get update
$ sudo apt-get install neovim
$ ln -s ~/.myconfig/dotfiles/.vimrc ~/.config/nvim/init.vim
```

#### prerequistes for the python modules

```sh   
$ sudo apt-get install python-dev python-pip python3-dev python3-pip
$ pip3 install neovim
```

- https://github.com/neovim/neovim/wiki/Installing-Neovim


### pyenv

```sh
$ sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl git
$ mkdir ~/.pyenv
$ git clone https://github.com/pyenv/pyenv.git ~/.pyenv
$ git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv 
---
$ pyenv install [version]
$ pyenv virtualenv [version] [version_name]
$ pyenv global [version_name]
$ sudo localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
```


## misc

#### tmux

```sh
$ sudo apt-get install tmux
$ ln -s ~/.myconfig/dotfiles/.tmux.conf ~/.tmux.conf
```

#### ctags

```sh
$ sudo apt-get install exuberant-ctags
```

#### ag

```sh
$ sudo apt-get install silversearcher-ag
```

#### direnv

