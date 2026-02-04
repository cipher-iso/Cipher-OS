[[ $- != *i* ]] && return

# [ NEW BASH PROMPT ]
PS1='\n\[\e[1;40m\]  \[\e[1;38;2;0;255;64m\]\[\e[0;40m\]  \[\e[1;38;2;0;255;64m\][ \[\e[1;38;2;50;52;73m\]\A\[\e[1;38;2;33;35;55m\]\[\e[40m\] \[\e[1;38;2;0;255;64m\]-\[\e[1;38;2;50;52;73m\] CIPHER\[\e[1;38;2;0;255;64m\] ]\[\e[40m\] \[\e[1;38;2;50;52;73m\]>\[\e[40m\] \[\e[1;38;2;0;255;64m\]\w\[\e[0m\] '

# [ OLD BASH PROMPT ]
# PS1='\n\[\e[40m\]  \[\e[38;2;0;255;64m\]\[\e[0;40m\]  \[\e[1;38;2;33;35;55m\][\[\e[0;38;2;50;52;73m\]\A\[\e[1;38;2;33;35;55m\]]\[\e[0;40m\] \[\e[1;38;2;0;255;64m\]ᴄɪᴘʜᴇʀ\[\e[0;40m\] \[\e[0;38;2;50;52;73m\]>\[\e[0;40m\] \[\e[1;38;2;33;35;55m\]\w\[\e[39m\] \[\e[0;38;2;0;255;64m\]'

# [ SHELL SETTINGS ]
export TERMINAL=kitty
export PATH="$HOME/Scripts:$PATH"
export PATH="$HOME/Scripts/ColorGen:$PATH"
export SUDO_PROMPT=$'\e[1;38;2;0;255;64m  > ENTER PASSPHRASE: \e[0m'

# [ SHORTCUTS ]
alias :q='exit'
alias :wq='exit'
alias ls='ls --color=auto'
alias ff='fastfetch -l none'
alias grep='grep --color=auto'

# [ INSTALL PACKAGES ]
alias aur='yay -S'
alias aurr='yay -Rns'
alias pak='flatpak install'
alias pakr='flatpak remove'
alias install='sudo pacman -S'
alias remove='sudo pacman -Rns'

# [ QUALITY-OF-LIFE ]
alias gif='Convert2Gif'
alias cc='ClearSystemCache'
alias update='RunUpdates -arch'
alias unlock='faillock --reset'
alias exec='hyprctl dispatch exec'
alias nvims='cd ~/Scripts && nvim'

# Custom Bash functions
if [ -f "$HOME/BashFunctions/SearchPKG.sh" ]; then
    source "$HOME/BashFunctions/SearchPKG.sh"
fi

