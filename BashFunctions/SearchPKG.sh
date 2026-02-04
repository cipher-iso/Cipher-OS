s() {
    local term="$1"
    local WHITE="\033[38;2;235;250;250m"
    local ORANGE="\033[38;2;255;165;0m"
    local GREEN="\033[38;2;0;255;64m"
    local BOLD="\033[1m"
    local RESET="\033[0m"

    [ -z "$term" ] && { echo -e "\n${GREEN}${BOLD}[ PACKAGE SEARCH: ${WHITE}s <TERM> ${GREEN}]${RESET}"; return; }

    local pac_results aur_results all_results i=0 pac_max=5 aur_max=5

    # Pacman search
    pac_results=($(pacman -Ss "$term" 2>/dev/null | awk -F'/' '{print $2}' | awk '{print $1}' | grep -i "$term" | head -n $pac_max))
    echo -e "\n${GREEN}${BOLD}[ TOP ${pac_max} PAC RESULTS ]${RESET}"
    if [ ${#pac_results[@]} -eq 0 ]; then
        echo -e "  ${BOLD}ERR:${RESET} ZER0 RESULTS"
    else
        for pkg in "${pac_results[@]}"; do
            echo -e "${ORANGE}${BOLD}[ ${i} ]${RESET} > $pkg"
            ((i++))
        done
    fi

    # AUR search
    aur_results=()
    local helper=$(command -v yay || command -v paru)
    [ "$helper" ] && aur_results=($($helper -Ss "$term" 2>/dev/null | awk -F'/' '{print $2}' | awk '{print $1}' | grep -i "$term" | head -n $aur_max))
    echo -e "\n${GREEN}${BOLD}[ TOP ${aur_max} AUR RESULTS ]${RESET}"
    if [ ${#aur_results[@]} -eq 0 ]; then
        echo -e "  ${BOLD}ERR:${RESET} ZER0 RESULTS" 
    else
        for pkg in "${aur_results[@]}"; do
            echo -e "${ORANGE}${BOLD}[ ${i} ]${RESET} > $pkg"
            ((i++))
        done
    fi

    all_results=("${pac_results[@]}" "${aur_results[@]}")
    [ ${#all_results[@]} -gt 0 ] || return

    # Install prompt (0 to n-1)
    local max_index=$(( ${#all_results[@]} - 1 ))
    read -p "$(echo -e "\n${GREEN}${BOLD}[ INSTALL PACKAGE: ${WHITE}<0-${max_index}> ${GREEN}| ${WHITE}ENTER ${GREEN}TO SKIP ] > ${RESET}")" choice
    if [[ "$choice" =~ ^[0-9]+$ ]] && (( choice >= 0 && choice <= max_index )); then
        local selected="${all_results[$choice]}"
        echo -e "${GREEN}${BOLD}[ INSTALLING ${WHITE}$selected ${GREEN}]${RESET}"
        if (( choice < ${#pac_results[@]} )); then
            sudo pacman -S "$selected"
        elif [ "$helper" ]; then
            $helper -S "$selected"
        else
            echo -e "${GREEN}[ NO AUR HELPER FOUND ]${RESET}"
        fi
    fi
}

