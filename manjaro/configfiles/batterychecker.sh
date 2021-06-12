#!/bin/bash

#export the necessary variables so that root under systemd knows where to draw the window and show the message
export DISPLAY=:0.0
export XAUTHORITY=/home/alejandro/.Xauthority

# Variables definition
batterypercent=$(cat /sys/class/power_supply/BAT1/capacity) 
batterystatus=$(cat /sys/class/power_supply/BAT1/status) 

#perform the multiplication to calculate time remaining
let timeremaining=$batterypercent*3

#Runs pluglistener and continues
#/home/alejandro/bin/pluglistener &

#if statement
if [ $batterypercent -le 5 ] && [ $batterystatus = Discharging ]
then 
		
	#Draw a simple window with a message
	zenity --warning --title="Battery very low" --text="Battery level is $batterypercent% ($timeremaining mins remaining) se me conecta ya ps"
	
fi

if test $batterystatus = Full
then

	#Draw a simple window with a message
	zenity --warning --title="Battery Charged" --text="Battery level is $batterypercent% , $batterystatus\y charged"
		
fi


exit 0


