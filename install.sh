#!/usr/bin/env bash

# INTERACTIVE DOTFILES INSTALLER
# -----------------------------
# - Run from inside the cloned dotfiles repo
# - Reads paths from Scripts/Dotfiles.conf
# - FORCE OVERWRITES existing files/directories
# - NO BACKUPS
# - Does NOT delete anything outside listed paths

set -u   # error on undefined vars (NOT -e)

DOTFILES_DIR="$(pwd)"
CONFIG_FILE="$DOTFILES_DIR/Scripts/Dotfiles.conf"

# COLORS
BOLD="\033[1m"
GREEN="\033[38;2;0;255;64m"
RESET="\033[0m"

# PROMPT FUNCTION
prompt_confirm() {
	local message="$1"
	local default="${2:-Y}"
	read -rp "$(echo -e "${BOLD}${GREEN}${message} [${default}/n] ${RESET}")" reply
	reply="${reply:-$default}"
	[[ "$reply" =~ ^[Yy]$ ]]
}

# CHECK CONFIG FILE
if [ ! -f "$CONFIG_FILE" ]; then
	echo -e "${BOLD}${GREEN}ERROR: $CONFIG_FILE not found${RESET}"
	exit 1
fi

# READ CONFIG
mapfile -t DOTFILES < <(grep -vE '^\s*#|^\s*$' "$CONFIG_FILE")

# INSTALL EVERYTHING PROMPT
if prompt_confirm "Install Everything" Y; then
	INSTALL_ALL=true
else
	INSTALL_ALL=false
fi

# INSTALL FUNCTION (FORCE OVERWRITE)
install_item() {
	local entry="$1"

	local target
	target="$(eval echo "$entry")"

	local source="$DOTFILES_DIR${target#$HOME}"

	if [ ! -e "$source" ]; then
		echo -e "${BOLD}${GREEN}Skipping missing: $source${RESET}"
		return
	fi

	echo -e "${BOLD}${GREEN}Installing $target${RESET}"

	# DELETE EXISTING TARGET (FILE OR DIR)
	if [ -e "$target" ]; then
		rm -rf "$target"
	fi

	# ENSURE PARENT EXISTS
	mkdir -p "$(dirname "$target")"

	# COPY CLEAN VERSION
	cp -a "$source" "$target"
}

# INSTALL PROCESS
for entry in "${DOTFILES[@]}"; do
	if [ "$INSTALL_ALL" = true ]; then
		install_item "$entry"
	else
		expanded="$(eval echo "$entry")"
		if prompt_confirm "Install $expanded" Y; then
			install_item "$entry"
		fi
	fi
done

# REBOOT PROMPT
if prompt_confirm "Done - Reboot now" Y; then
	echo -e "${BOLD}${GREEN}Rebooting...${RESET}"
	sudo reboot
else
	echo -e "${BOLD}${GREEN}Done! Reboot manually later.${RESET}"
fi
