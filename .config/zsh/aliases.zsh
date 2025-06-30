# My aliases
ngrep () { grep -r "$1" ~/Google\ Drive/My\ Drive/Notes/*; }
nagrep () { grep -rA "$1" "$2" ~/Google\ Drive/My\ Drive/Notes/*; }
nbgrep () { grep -rB "$1" "$2" ~/Google\ Drive/My\ Drive/Notes/*; }

alias zshu="zinit self-update && zinit update"

alias cm=chezmoi
alias cma="chezmoi apply"
alias cmd="chezmoi cd"
alias cmu="chezmoi update"
alias cmg="chezmoi cd; lazygit"

alias nxw="darwin-rebuild switch --flake $HOME/.config/nix-config#work-aarch64"
alias nxp="darwin-rebuild switch --flake $HOME/.config/nix-config#personal-aarch64"
alias nxd="cd $HOME/.config/nix-config"
alias nxuw="git pull $HOME/.config/nix-config && darwin-rebuild switch --flake $HOME/.config/nix-config#work-aarch64"
alias nxup="git pull $HOME/.config/nix-config && darwin-rebuild switch --flake $HOME/.config/nix-config#personal-aarch64"
alias nxul="git pull $HOME/.config/nix-config && $(cd)"

alias e=$EDITOR
alias tfp='AWS_PROFILE="personal" terraform'
alias lzg=lazygit
alias lzd=lazydocker
alias gdrive="$HOME/Google\ Drive/My\ Drive/"
alias notes="$HOME/Google\ Drive/My\ Drive/Notes/"
alias d=exit
alias wiki='nvim -S ~/remitlywiki/gtd.vim'

# ls, the common ones I use a lot shortened for rapid fire usage
alias l='lsd -lFh'     #size,show type,human readable
alias la='lsd -lAFh'   #long list,show almost all,show type,human readable
alias lr='lsd -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='lsd -lFh --tree'   #long list,show type,human readable, tree
alias ll='lsd -l'      #long list
alias ldot='lsd -ld .*'
alias lS='lsd -1FSsh'
alias lart='lsd -1Fcart'
alias lrt='lsd -1Fcrt'
alias lsr='lsd -lARFh' #Recursive list of files and directories
alias lsn='lsd -1'     #A column contains name of files and directories

alias zshrc='${=EDITOR} ${ZDOTDIR:-$HOME}/.zshrc' # Quick access to the .zshrc file

# Functions (also see zshenv for global functions)
unalias gam
alias gam=$HOME/bin/gamadv-xtd3/gam

# awsp() {
#     aws "$@" --profile personal
# }
function awsg() {
    aws "$@" --profile iamadmin-general
}
function awsp() {
    aws "$@" --profile iamadmin-production
}

function aiout() {
    docker run --rm \
        -v $(pwd):/repo \
        --name gpt-repository \
        gpt-repository
}

function dev() {
    if [[ "$1" ]]; then
        name=--name=$1
    else
        name=""
    fi
    docker run\
        -d\
        -p 2222:22\
        -e TZ=$(readlink /etc/localtime | sed 's#/var/db/timezone/zoneinfo/##g')\
        -v $(pwd):/workspace/${PWD##*/}\
        -v /var/run/docker.sock:/var/run/docker.sock:rw\
        -v ~/.zsh_history:/home/$(whoami)/.zsh_history\
        -v ~/.ssh:/home/$(whoami)/.ssh\
        -v ~/.okta/:/home/$(whoami)/.okta\
        -v ~/go:/home/$(whoami)/go\
        -v vimtmp:/home/$(whoami)/.vim\
        $name\
        --pid="host"\
        dev
}

function doc() {
    if [[ "$1" ]]; then
        name=--name=$1
    else
        name=""
    fi
    docker run\
        --rm -it\
        -e TZ=$(readlink /etc/localtime | sed 's#/var/db/timezone/zoneinfo/##g')\
        -v $(pwd):/workspace/${PWD##*/}\
        -v ~/.zsh_history:/home/$(whoami)/.zsh_history\
        -v ~/remitlywiki/:/home/$(whoami)/remitlywiki\
        -v ~/personalwiki/:/home/$(whoami)/personalwiki\
        -v vimtmp:/home/$(whoami)/.vim\
        $name\
        --pid="host"\
        doc
}

# Vimwiki
function vw() {
    session="notes"
    window="GTD"
    tmuxWindow="$session:$window"
    file="~/remitlywiki/gtd.vim"

    if [[ $(whoami) == d4lan ]]; then 
        file="~/personalwiki/index.vim"
    fi

    if [[ ! $(tmux list-windows -t $session | grep ": $window") ]]; then 
        tmux new -s $session -d
        tmux rename-window $window
        tmux send-keys -t $tmuxWindow "nvim -S $file" ENTER
    fi

    tmux attach -t $session
    tmux select-window -t $tmuxWindow
    tmux switch -t $tmuxWindow
}

# Vimwiki Search
function ws() {
    file=~/RemitlyWiki

    if [[ "$2" ]]; then
        file=$2
    fi

    search=${1//\"/}
    find $file/* -type f -name "*.md" -exec \
        awk '!/^ /{p=0} tolower($0) ~ /'"$search"'/{p=1} p {print FILENAME"\|", NR"\|", $0}' {} \; \
        | column -ts "|"
}
