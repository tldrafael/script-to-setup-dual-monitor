#! /usr/bin/env bash

N_DISPLAY=$( xrandr -d :0 -q | grep ' connected' | wc -l )

if [ ${N_DISPLAY} -eq 2 ];
then
	xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
	xrandr --newmode "1368x768_60.00"   85.25  1368 1440 1576 1784  768 771 781 798 -hsync +vsync
	
	xrandr --addmode HDMI-1 "1920x1080"
	xrandr --addmode eDP-1 "1366x768"	
	
	xrandr --auto --output HDMI-1 --left-of eDP-1
	xrandr --output HDMI-1 --mode "1920x1080" --rate 60 
	xrandr --output eDP-1 --mode "1366x768" --rate 60 
	xrandr --output eDP-1 --primary
	xrandr --auto --output HDMI-1 --left-of eDP-1

fi


