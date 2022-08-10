# Coloring of common file showing commands
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# easy show all ls commmand
alias lsa="ls -alh"
alias lsl="ls -lh"

# return the size of a directory
size() {
    ls "$1" | wc -l
}

# PS1 bash prompt configuration
# Define colors
NORMAL="\[\033[0m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
PURPLE="\[\033[0;35m\]"
CYAN="\[\033[0;36m\]"

# prompt is: [time] user@hostname:pwd$
export PS1="$RED[\t] $YELLOW\u$GREEN@$BLUE\h:$CYAN\W$PURPLE$ $NORMAL"

## Programs
#alias discord="/home/cob/Applications/Discord/Discord"
#alias spt="snap run spt" ## Debian
alias spt="$HOME/Applications/spt" ## Arch
alias openrgb="sudo /home/cob/Applications/OpenRGB_0.7_x86_64_6128731.AppImage"
# watch the devices connected to my network
alias show_network_devices="watch -n 5 $HOME/.config/scripts/show_network_devices.sh"
alias latex_clean="$HOME/.config/scripts/latex_clean.sh"

# Open in default application
alias open="xdg-open"

## Coding
alias python="python3"
alias ipython="$HOME/.local/bin/ipython"

## System suspension
alias suspend='systemctl suspend'

## Copy
alias pbcopy="xsel --clipboard --input"
alias pbpaste="xsel --clipboard --output"

## syntax highlighting within ranger
export HIGHLIGHT_STYLE=moria

# Navigation
alias goto_school="cd ~/Documents/OMSCS/"
alias goto_vim="cd ~/dotfiles/config/nvim/"
alias goto_dots="cd ~/dotfiles"
alias goto_wiki="cd ~/vimwiki"
