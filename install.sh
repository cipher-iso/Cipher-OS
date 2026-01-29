#!/usr/bin/env bash
# ===================== PATHS =====================
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PKG_CONF="$DOTFILES_DIR/DotfilesPKG.conf"
CONFIG_FILE="$DOTFILES_DIR/Scripts/Dotfiles.conf"
SOURCE_ENV="$DOTFILES_DIR/Scripts/Environment.conf"
ENV_FILE="$DOTFILES_DIR/.config/hypr/Config/Environment.conf"

# ===================== FUNCTIONS =====================
# GRADIENT BANNERS
print_gradient() {
  local b_start=64 b_end=153 i=0
  while IFS= read -r line; do
    local total=$1
    local b=$((b_end - (b_end-b_start)*i/(total-1)))
    printf "\e[38;2;0;255;%dm%s\e[0m\n" "$b" "$line"
    ((i++))
  done
}
# INSTALLATION SUCCESS
ok()   { echo -e "\033[1m\033[38;2;0;255;64m[  > $1 ]\033[0m"; }
# INSTALLATION FAILED
fail() { echo -e "\033[1m\033[38;2;255;64;64m[  > $1 ]\033[0m"; }
# ACCEPT / DECLINE PROMPT
prompt() { read -rp "$(echo -e "\033[1m\033[38;2;0;255;64m[ $1 - <Y/n> ]\033[0m")" r; [[ -z $r || $r =~ ^[Yy]$ ]]; }


# ===================== SUDO =====================
export SUDO_PROMPT=$'\e[1;38;2;0;255;64m  > ENTER PASSPHRASE: \e[0m'
sudo -v || exit 1
( while sudo -n true; do sleep 60; done ) 2>/dev/null &

# ===================== INPUT =====================
[[ -f $CONFIG_FILE ]] || { fail "DOTFILES.CONF NOT FOUND"; exit 1; }
mapfile -t DOTFILES < <(grep -vE '^\s*#|^\s*$' "$CONFIG_FILE")

# ===================== PACKAGES =====================
PACMAN_PKGS=($(awk '/^# PACMAN PKG/{f=1;next}/^#/{f=0} f && NF' "$PKG_CONF"))
AUR_PKGS=($(awk '/^# AUR PKG/{f=1;next}/^#/{f=0} f && NF' "$PKG_CONF"))

PAC_OK=0; PAC_FAIL=(); AUR_OK=0; AUR_FAIL=(); DIR_OK=0; DIR_FAIL=()

# ===================== TOP ASCII =====================
printf "%s\n" "┏┳━  ┓ ┏┏┓┓ ┏┓┏┓┳┳┓┏┓  ┏┳┓┏┓  ┏┓┳┏┓┓┏┏┓┳┓  ┏┓┏┓  ━┳┓
┃┃   ┃┃┃┣ ┃ ┃ ┃┃┃┃┃┣    ┃ ┃┃  ┃ ┃┃┃┣┫┣ ┣┫━━┃┃┗┓   ┃┃
┗┻━  ┗┻┛┗┛┗┛┗┛┗┛┛ ┗┗┛   ┻ ┗┛  ┗┛┻┣┛┛┗┗┛┛┗  ┗┛┗┛  ━┻┛" | print_gradient 3

# ===================== INSTALL PACKAGES =====================
prompt "INSTALL REPOSITORIES?" && {
  for p in "${PACMAN_PKGS[@]}"; do
    sudo pacman -S --needed --noconfirm "$p" && ((PAC_OK++)) || PAC_FAIL+=("$p")
  done

  command -v yay &>/dev/null || { AUR_FAIL+=("${AUR_PKGS[@]}"); return; }

  for p in "${AUR_PKGS[@]}"; do
    yay -S --needed --noconfirm "$p" && ((AUR_OK++)) || AUR_FAIL+=("$p")
  done
}

# ===================== NVIDIA INSTALL =====================
printf "%s\n" "┏┳━  ┳┓╻┓╻┓┳┓┳┏┓  ┓┳┓┏┓┏┳┓┏┓┓ ┓   ━┳┓
┃┃   ┃┃┃┃┃┃┃┃┃┣┫  ┃┃┃┗┓ ┃ ┣┫┃ ┃    ┃┃
┗┻━  ┛┗┛┗┛┻┻┛┻┛┗  ┻┛┗┗┛ ┻ ┛┗┗┛┗┛  ━┻┛" | print_gradient 3

read -rp "$(echo -e "\033[1m\033[38;2;0;255;64m[ INSTALL NVIDIA PACKAGES? - <Y/n> ]\033[0m")" nvidia_answer
if [[ -z $nvidia_answer || $nvidia_answer =~ ^[Yy]$ ]]; then
    sudo pacman -S --needed nvidia-utils lib32-nvidia-utils egl-wayland
    NVIDIA_INSTALL=1
else
    NVIDIA_INSTALL=0
fi

# ===================== INSTALL DOTFILES =====================
prompt "INSTALL ALL DOTFILES?" && {
  for d in "${DOTFILES[@]}"; do
    target="${d/\$HOME/$HOME}"
    source="$DOTFILES_DIR${target#$HOME}"
    [[ -e $source ]] && rm -rf "$target" && mkdir -p "$(dirname "$target")" && cp -a "$source" "$target" && ((DIR_OK++)) || DIR_FAIL+=("$target")
  done

  # Copy Environment.conf and remove NVIDIA if declined
  mkdir -p "$(dirname "$ENV_FILE")"
  cp -a "$SOURCE_ENV" "$ENV_FILE"
  [[ $NVIDIA_INSTALL -eq 0 ]] && [[ -f $ENV_FILE ]] && sed -i '/# NVIDIA SETTINGS/,/^$/d' "$ENV_FILE"
}

# ===================== END ASCII =====================
printf "%s\n" "┏┳━  •┳┓┏┓┏┳┓┏┓┓ ┓  ┏┓┓┏  ┏┓┏┓┳┳┓┏┓┓ ┏┓┏┳┓┏┓  ━┳┓
┃┃   ┓┃┃┗┓ ┃ ┣┫┃ ┃  ┗┓┣┫  ┃ ┃┃┃┃┃┃┃┃ ┣  ┃ ┣    ┃┃
┗┻━  ┗┛┗┗┛ ┻ ┛┗┗┛┗┛•┗┛┛┗  ┗┛┗┛┛ ┗┣┛┗┛┗┛ ┻ ┗┛  ━┻┛" | print_gradient 3

# ===================== SUMMARY =====================
echo
ok "$PAC_OK REPOSITORIES INSTALLED!"; for p in "${PAC_FAIL[@]}"; do fail "PACMAN: $p FAILED!"; done
ok "$AUR_OK USER-REPOS INSTALLED!"; for p in "${AUR_FAIL[@]}"; do fail "AUR: $p FAILED!"; done
ok "$DIR_OK DIRECTORIES IMPORTED!"; for d in "${DIR_FAIL[@]}"; do fail "DIR ($d) FAILED!"; done

# ===================== REBOOT =====================
read -rp "$(echo -e "\033[1m\033[38;2;234;255;0m[ INSTALLATION COMPLETE - REBOOT SYSTEM? - <Y/n> ]\033[0m")" r
[[ -z $r || $r =~ ^[Yy]$ ]] && sudo reboot
