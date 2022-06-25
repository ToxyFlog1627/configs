#!/bin/sh

update_date () { date=$(date +"%a, %d %b %H:%M %p"); }
update_language () { language=$(if [[ $(xset -q|grep LED| awk '{ print $10 }') == 00000000 ]]; then echo 'US'; else echo 'RU'; fi); }
update_updates () { 
    updatesNum=$(yay -Syup | awk '{print $2}' | grep -v '\n' | wc -l)
    updates=$(if [[ $updatesNum > 0 ]]; then echo "$updatesNum $(if [[ $updatesNum == 1 ]]; then echo "update"; else echo "updates"; fi)"; fi)
}
update_microphone () {
    isMuted=$(($(amixer get Capture | grep "\[on\]" | wc -l) == 0))
    microphone=$(if [[ $isMuted == 1 ]]; then echo ""; else echo ""; fi)
}
update_volume () {
    volumePercentage=$(amixer get Master| grep "Front Left: Playback" | sed -E "s/.*\[([0-9]+)%\].*/\1/g")
    volume="$volumePercentage% $(if [[ $volumePercentage == 0 ]]; then echo "婢"; else echo "墳"; fi)"
}

display () { xsetroot -name " $volume | $microphone | $language $(if [[ $updates ]]; then echo "| $updates "; fi)| $date"; }

while true; do
    update_date
    update_language
    if [[ $1 != false ]]; then update_updates; fi
    update_microphone
    update_volume
    
    display
    echo $updates    
    if [[ $loop == false ]]; then break; fi

    sleep $((60 - $(date +%S)))
    wait
done
