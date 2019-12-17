#!/bin/sh

# git
echo "*** download dotfiles ***"
cd ~
sudo apt-get install -y git
mkdir -p -v .myconfig
cd .myconfig
git clone https://github.com/camembert-t/dotfiles.git

# fish
echo "*** install fish-shell ***"
cd ~
sudo apt-add-repository -y ppa:fish-shell/release-3
sudo apt-get update -y
sudo apt-get install -y fish
mkdir -p -v .config/fish/functions
ln -s ~/.myconfig/dotfiles/fish/config.fish ~/.config/fish/config.fish
ln -s ~/.myconfig/dotfiles/fish/fishfile ~/.config/fish/fishfile
ln -s ~/.myconfig/dotfiles/fish/fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish

# neovim
echo "*** install neovim ***"
cd ~
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:neovim-ppa/stable
sudo apt-get update -y
sudo apt-get install -y neovim
mkdir -p -v .config/nvim
ln -s ~/.myconfig/dotfiles/.vimrc ~/.config/nvim/init.vim
sudo apt-get install -y python-dev python-pip python3-dev python3-pip
pip install --upgrade pip
pip3 install neovim
pip3 install pynvim

# pyenv
echo "*** install pyenv ***"
cd ~
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl git
mkdir -p -v .pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

# misc
echo "*** install misc ***"
cd ~
sudo apt-get install -y tmux
ln -s ~/.myconfig/dotfiles/.tmux.conf ~/.tmux.conf
sudo apt-get install -y exuberant-ctags
sudo apt-get install -y silversearcher-ag

# setting
echo "*** setting ***"
sudo localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
tmux
pyenv install 3.8.0
pyenv virtualenv 3.8.0 develop
pyenv global 3.8.0/envs/develop

# message
echo "\n\n\n"
echo "*** some settings should be done by hand ***"
echo "/user/local/bin/fish -> /user/bin/fish (.tmux.conf)"
echo "fix python3_pass (.vimrc)"
echo "fix fish_prompt (fish_prompt.fish)"
echo ":PlugInstall (in nvim)"
echo ":UpdateRemotePlugins (in nvim)"
