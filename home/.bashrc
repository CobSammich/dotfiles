#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

#Display ISO version and distribution information in short
alias version="sed -n 1p /etc/os-release && sed -n 11p /etc/os-release && sed -n 12p /etc/os-release"

#Pacman Shortcuts
alias sync="sudo pacman -Syyy"
alias install="sudo pacman -S"
alias update="sudo pacman -Syyu"
alias search="sudo pacman -Ss"
alias search-local="sudo pacman -Qs"
alias pkg-info="sudo pacman -Qi"
alias local-install="sudo pacman -U"
alias clr-cache="sudo pacman -Scc"
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias remove="sudo pacman -R"
alias autoremove="sudo pacman -Rns"

#######################
# source the aliases in .bash_aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# pandoc
export PATH="$HOME/git_repos/pandoc/bin:$PATH"
# pip installed packages
export PATH="$HOME/.local/bin:$PATH"
# Keep track of current directory -- this is for opening new terminals in pwd for i3
export PROMPT_COMMAND="pwd > /tmp/whereami"

HISTSIZE=20000
HISTFILESIZE=20000

# include snap installed programs in path
export PATH="$PATH:/snap/bin/"

## run program at bash start
#fortune -a computers
neofetch #| lolcat


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
