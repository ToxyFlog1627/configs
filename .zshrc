export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="simple"
CASE_SENSITIVE="true"
plugins=()

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 3

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

# export ARCHFLAGS="-arch x86_64"


alias ll='lsd -al'
alias btm='btm --color nord && clear'
alias clock='tty-clock -s -c -C 5 -D'
alias spt="spt && clear"

yay () {
   if [[ $@ == '' ]]; then
        /bin/yay
        /home/tx/scripts/refresh_status_bar.sh
    else
        /bin/yay $@
    fi
}
