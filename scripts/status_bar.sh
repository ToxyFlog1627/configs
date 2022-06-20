#!/bin/sh

xsetroot -name "$(date +"%a, %d %b %H:%M %p")"
sleep $((60 - $(date +%S)))

lastUpdate=0
while true; do
    date="| $(date +"%a, %d %b %H:%M %p")"

    language="| $(if [[ $(xset -q|grep LED| awk '{ print $10 }') == 00000000 ]]; then echo 'US'; else echo 'RU'; fi) "

    updatesNum=0
    if [[ $(($(date +%s) - $lastUpdate)) > 20 ]]; then
        updatesNum=$(yay -Syup | awk '{print $2}' | grep -v '\n' | wc -l)
        lastUpdate=$(date +%s)
    fi
    updates=$(if [[ $updatesNum > 0 ]]; then echo "| $updatesNum $(if [[ $updatesNum == 1 ]]; then echo "update"; else echo "updates"; fi) "; fi)

    isMuted=$(($(amixer get Capture | grep "\[on\]" | wc -l) == 0))
    mic="| $(if [[ $isMuted == 1 ]]; then echo ""; else echo ""; fi) "

    volumePercentage=$(amixer get Master| grep "Front Left: Playback" | sed -E "s/.*\[([0-9]+)%\].*/\1/g")
    volume=" $volumePercentage% $(if [[ $volumePercentage == 0 ]]; then echo "婢"; else echo "墳"; fi) "

    xsetroot -name "$volume$mic$updates$language$date"
    
    sleep $((60 - $(date +%S)))
    wait
done
