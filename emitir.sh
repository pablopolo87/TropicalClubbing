#!/bin/bash

ffmpeg -re \
-loop 1 -framerate 2 -i fondo.png \
-stream_loop -1 -f concat -safe 0 -i playlist.txt \
-shortest \
-c:v libx264 -preset veryfast -tune stillimage -b:v 2500k \
-c:a aac -b:a 128k -ar 44100 \
-f flv "rtmp://a.rtmp.youtube.com/live2/05fu-mqjb-zca8-6d3c-e9xx"
