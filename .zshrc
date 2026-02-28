# [ COLOR GENERATION ]
source "$HOME/Scripts/ColorGen/Colors.zsh"

# [ BASH PROMPT ]
PROMPT=$'\n'"%{$(echo -ne '\033[1;38;2;'"$FG_HIGHLIGHT"'m')%}   %{$(echo -ne '\033[0;40m')%}   %{$(echo -ne '\033[1;38;2;'"$FG_HIGHLIGHT"'m')%}[ %{$(echo -ne '\033[1;38;2;'"$FG_ACCENT"'m')%}%D{%L:%M}%{$(echo -ne '\033[1;38;2;'"$FG_ACCENT"'m')%} %{$(echo -ne '\033[1;38;2;'"$FG_HIGHLIGHT"'m')%}-%{$(echo -ne '\033[1;38;2;'"$FG_ACCENT"'m')%} ${(U)USER}%{$(echo -ne '\033[1;38;2;'"$FG_HIGHLIGHT"'m')%} ] %{$(echo -ne '\033[1;38;2;'"$FG_ACCENT"'m')%}%~ %{$(echo -ne '\033[1;38;2;'"$FG_HIGHLIGHT"'m')%}>%{$(echo -ne '\033[0m')%} "

# [ SHELL SETTINGS ]
export TERMINAL=kitty
export PATH="$HOME/Scripts:$PATH"
export PATH="$HOME/Scripts/ColorGen:$PATH"
export SUDO_PROMPT="$(echo -ne '\033[1;38;2;'"$FG_HIGHLIGHT"'m  > ENTER PASSPHRASE: \033[0m')"
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
setopt globdots

# [ SHORTCUTS ]
alias :q='exit'
alias :wq='exit'
alias ff='fastfetch'
alias ls='ls -a --color=auto'
alias grep='grep --color=auto'

# [ INSTALL PACKAGES ]
alias aur='yay -S'
alias aurr='yay -Rns'
alias pak='flatpak install'
alias pakr='flatpak remove'
alias install='sudo pacman -S'
alias remove='sudo pacman -Rns'

# [ QUALITY-OF-LIFE ]
alias nvims='sudo -E nvim'
alias unlock='faillock --reset'
alias hypr='hyprctl dispatch exec'

# [ QUICK SCRIPTS ]
alias s='SearchPKG'
alias r='RecentPKG'
alias update='Update'
alias gif='Convert2Gif'
alias cc='ClearCache'

# [ SHELL PLUGINS ]
plugins=( 
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
)
