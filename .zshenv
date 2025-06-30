# .zshenv is always sourced. It often contains exported variables that should be available to other programs. 
# For example, $PATH, $EDITOR, and $PAGER are often set in .zshenv. 

export GOPATH=$HOME/go
export PATH=$PATH:/snap/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.cargo/bin
export LG_CONFIG_FILE="$HOME/.config/lazygit/config.yml"
export ZDOTDIR="$HOME/.config/zsh"
export VISUAL="nvim"
export EDITOR="nvim"

# For secrets use: security add-generic-password -a "$USER" -s '{key}' -w '{value}'
