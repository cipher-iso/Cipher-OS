# [ COLOR GENERATION ]
source "$HOME/Scripts/ColorGen/Colors.zsh"

# [ BASH PROMPT ]
PROMPT=$'\n'"%{$(echo -ne '\033[1;38;2;'"$PRIMARY"'m')%} 󰫢%{$(echo -ne '\033[0;40m')%}  %{$(echo -ne '\033[1;38;2;'"$PRIMARY"'m')%}[ %{$(echo -ne '\033[1;38;2;'"$SECONDARY"'m')%}%D{%L:%M}%{$(echo -ne '\033[1;38;2;'"$SECONDARY"'m')%} %{$(echo -ne '\033[1;38;2;'"$PRIMARY"'m')%}-%{$(echo -ne '\033[1;38;2;'"$SECONDARY"'m')%} ${(U)USER}%{$(echo -ne '\033[1;38;2;'"$PRIMARY"'m')%} ] %{$(echo -ne '\033[0;38;2;'"$ACCENT1"'m')%}%~ %{$(echo -ne '\033[1;38;2;'"$PRIMARY"'m')%}>%{$(echo -ne '\033[0m')%} "

# [ SHELL SETTINGS ]
setopt globdots
export EDITOR=nvim
export TERMINAL=kitty
export PATH="$HOME/Scripts:$PATH"
export PATH="$HOME/Scripts/ColorGen:$PATH"
export SUDO_PROMPT="$(echo -ne '\033[1;38;2;'"$PRIMARY"'m  > ENTER PASSPHRASE: \033[0m')"
export ZSH="$HOME/.oh-my-zsh"

# [ SHORTCUTS ]
alias :q='exit'
alias :wq='exit'
alias ff='fastfetch'
alias ls='ls -a --color=auto'
alias grep='grep --color=auto'

# [ INSTALL PACKAGES ]
alias aur='yay -S'
alias aurr='yay -Rns'
alias auru='yay -Syu'
alias pak='flatpak install'
alias pakr='flatpak remove'
alias paku='flatpak update'
alias pacu='sudo pacman -Syu'
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

# [ FZF INTEGRATION & OMZ ]
source $ZSH/oh-my-zsh.sh
source "/usr/share/fzf/key-bindings.zsh"

export FZF_DEFAULT_OPTS="
--height=100%
--border=sharp
--layout=reverse
--bind='ctrl-z:clear-query'
--prompt='QUERY SIGNAL > '
--pointer='▋'
--marker='󰘽'
--color=\
bg:#000000,\
bg+:"$hACCENT2",\
fg:"$hACCENT2",\
fg+:"$hPRIMARY",\
prompt:"$hPRIMARY",\
pointer:"$hPRIMARY",\
hl:"$hPRIMARY",\
hl+:"$hSECONDARY",\
info:"$hACCENT1",\
border:"$hPRIMARY"
"
