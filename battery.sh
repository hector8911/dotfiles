#!/bin/sh

while true
do
	export DISPLAY=:0.0
	battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
	ac_power=$(acpi -b|grep -c "Charging")
	if [[ $ac_power -eq 1 && $battery_level = 98 ]]; then
		notify-send -u low -i "~/Pictures/battery-full.png" "Battery is full"
	elif [[ $ac_power -eq 0 && $battery_level -le 15 ]]; then
		notify-send -u critical -i "~/Pictures/battery-low.png" "${battery_level}%, Battery is lower"
	fi

	sleep 300
done
