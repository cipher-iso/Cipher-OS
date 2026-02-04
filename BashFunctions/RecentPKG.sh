#!/usr/bin/env bash
# ~/BashFunctions/RecentPKG

r() {
    local paclog="/var/log/pacman.log"

    local bold="\033[1m"
    local reset="\033[0m"

    local color_date="\033[38;2;235;250;250m"   # #EBFAFA
    local color_pkg="\033[38;2;255;1;59m"       # #FF013B
    local color_ver="\033[38;2;49;52;79m"       # #31344F
    local color_all="\033[38;2;0;255;64m"       # #00FF40

    echo

    # Track already-listed packages
    declare -A seen
    local count=0
    local max=10

    tac "$paclog" | grep -F " installed " | while read -r line; do
        # Stop once we have enough unique packages
        (( count >= max )) && break

        # Extract date
        local date
        date="$(
            awk '{print $1}' <<<"$line" \
            | tr -d '[]' \
            | cut -dT -f1 \
            | awk -F- '{printf "%s.%s.%s", $3,$2,$1}'
        )"

        # Extract package + version
        local pkg ver
        pkg="$(sed -n 's/.*installed \([^ ]*\).*/\1/p' <<<"$line")"
        ver="$(sed -n 's/.*installed [^ ]* (\([^)]*\)).*/\1/p' <<<"$line")"

        # Skip duplicates
        [[ -n "${seen[$pkg]}" ]] && continue
        seen["$pkg"]=1
        ((count++))

        # Output
        echo -e "${bold}${color_all}[ ${color_date}${date}${bold}${color_all} ] > \
${bold}${color_pkg}${pkg}${reset} ${color_ver}${ver}${reset}"
    done
}
