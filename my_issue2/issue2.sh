#!/usr/bin/env bash
total=100

width=100

update_progress() {
    local progress="$1"
    local filled_width=$((progress * width / 100))
    local empty_width=$((width - filled_width))

    eqnumber=""
    for ((i = 0; i < filled_width; i++)); do
        eqnumber+="="
    done
    eqnumber+=">"

    empty=""
    for ((i = 0; i < empty_width; i++)); do
        empty+="-"
    done

    now_progress="$progress%"

    printf "\r[%-${width}s] %3s" "$eqnumber$empty" "$now_progress"
}

current=0
while [ "$current" -le "$total" ]; do
    update_progress "$current"
    sleep 0.1
    current=$((current + 1))
done

echo
