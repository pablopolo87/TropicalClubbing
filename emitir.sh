#!/bin/bash

ffmpeg -re \
-loop 1 -framerate 2 -i fondo.png \
-f concat -safe 0 -i playlist.txt -shortest \
-c:v libx264 -preset ultrafast -tune stillimage -b:v 900k -pix_fmt yuv420p \
-c:a aac -b:a 128k -ar 44100 \
-f flv "rtmp://a.rtmp.youtube.com/live2/05fu-mqjb-zca8-6d3c-e9xx"
