export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="simple"
CASE_SENSITIVE="true"
plugins=()

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 3

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"


alias ll='lsd -al'
alias btm='btm --color nord && clear'
alias clock='tty-clock -s -c -C 5 -D'
alias spt="clear && spt && clear"
alias ranger="ranger $@ && clear"

yay() {
    if [[ $@ == '' ]]; then
        /bin/yay
        (/home/tx/scripts/refresh_status_bar.sh true &) > /dev/null
    else
        /bin/yay $@
    fi
}

man() {
    /bin/man $@
    clear
}

vim() {
    /bin/vim $@
    clear
}
