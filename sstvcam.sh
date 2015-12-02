#!/bin/bash

while [ "0" = "0" ] ; do

    #raspistill -t 1 --width 320 --height 256 -e png -o /tmp/image.png
    fswebcam --top-banner --title "From: MW0SZE" --font Arial:14 --png 1 -r 320x240 --timestamp "%H:%M %Y-%m-%d"  -D0 /tmp/image.png

    # add callsign
    #mogrify -pointsize 24 -draw "text 10,40 'MW0SZE'" /tmp/image.png

    killall xli
    xli -fit -fillscreen -fullscreen /tmp/image.png &

    ./pisstv /tmp/image.png 22050
    aplay /tmp/image.png.wav

    sleep 30

done