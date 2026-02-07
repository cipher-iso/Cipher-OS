export ZSH="$HOME/.oh-my-zsh"

# [ BASH PROMPT ]

PROMPT=$'\n%{\e[1;40m%}  %{\e[1;38;2;0;255;64m%}%{\e[0;40m%}  %{\e[1;38;2;0;255;64m%}[ %{\e[1;38;2;50;52;73m%}%*%{\e[1;38;2;33;35;55m%} %{\e[1;38;2;0;255;64m%}-%{\e[1;38;2;50;52;73m%} CIPHER%{\e[1;38;2;0;255;64m%} ] %{\e[1;38;2;50;52;73m%}> %{\e[1;38;2;0;255;64m%}%~%{\e[0m%} '

# [ SHELL SETTINGS ]

export TERMINAL=kitty
export PATH="$HOME/Scripts:$PATH"
export PATH="$HOME/Scripts/ColorGen:$PATH"

# Zsh respects this the same way as Bash
export SUDO_PROMPT=$'\e[1;38;2;0;255;64m  > ENTER PASSPHRASE: \e[0m'

# [ SHORTCUTS ]
alias :q='exit'
alias :wq='exit'
alias ls='ls --color=auto'
alias ff='fastfetch'
alias grep='grep --color=auto'

# [ INSTALL PACKAGES ]
alias aur='yay -S'
alias aurr='yay -Rns'
alias pak='flatpak install'
alias pakr='flatpak remove'
alias install='sudo pacman -S'
alias remove='sudo pacman -Rns'

# [ QUALITY-OF-LIFE ]
alias unlock='faillock --reset'
alias hypr='hyprctl dispatch exec'

# [ QUICK SCRIPTS ]
alias gif='Convert2Gif'
alias cc='ClearSystemCache'
alias update='RunUpdates -arch'
alias s='SearchPKG'
alias r='RecentPKG'

# [ SHELL PLUGINS ]

plugins=( 
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
