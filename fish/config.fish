### environment ###
set fish_greeting ''
set -x LANG ja_JP.UTF-8
set -x LC_ALL ja_JP.UTF-8
set -x TERM xterm-256color
set -x EDITOR vim
set -x XDG_CONFIG_HOME ~/.config
set -x PATH $PATH /opt/homebrew/bin

# vi mode
function fish_mode_prompt
end
fish_vi_key_bindings


### alias ###
alias la='ls -a'
alias ll='ls -l'
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'


### function ###
function cd
    builtin cd $argv[1]
    ls
end

function j
    z -l | awk '{ print $2 }' | fzf | read selected_dir

    if test -n $selected_dir
        cd $selected_dir
    end
end


### tool ###
# fisherman
if not functions -q fisher
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# neovim
if test (string length (type 'nvim' ^/dev/null)) -gt 0 ^/dev/null
    set -x EDITOR nvim
    alias vi='vim'
    alias vim='nvim'
end

# pyenv
if test -d $HOME/.pyenv
    set -x PYENV_ROOT "$HOME/.pyenv"
    set -x PATH "$PYENV_ROOT/bin" $PATH 
    status --is-interactive; and source (pyenv init -|psub); and source (pyenv virtualenv-init -|psub)
end

# direnv
if test (string length (type 'direnv' ^/dev/null)) -gt 0 ^/dev/null
    eval (direnv hook fish)
end


### plugin ###
# z
eval (mkdir -p $HOME/.z)
set -x Z_CMD 'z'
set -x Z_DATA "$HOME/.z/.z_data"

# fzf
set -U FZF_LEGACY_KEYBINDINGS 0
set -x FZF_FIND_FILE_COMMAND 'ag --hidden -g ""'
set -x FZF_OPEN_COMMAND 'ag --hidden -g ""'
set -x FZF_DEFAULT_OPTS '--height 40% --reverse --border'
