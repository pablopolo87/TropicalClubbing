#!/bin/bash

ffmpeg -re \
-stream_loop -1 -i fondo.mp4 \
-stream_loop -1 -f concat -safe 0 -i playlist.txt \
-shortest \
-c:v libx264 -preset veryfast -maxrate 2500k -bufsize 5000k \
-c:a aac -b:a 128k -ar 44100 \
-f flv "rtmp://a.rtmp.youtube.com/live2/05fu-mqjb-zca8-6d3c-e9xx"

