#!/bin/bash

#!/bin/bash

# Clave de emisión de YouTube (reemplazar por la suya si no está en variable)
STREAM_URL="rtmp://a.rtmp.youtube.com/live2"
STREAM_KEY="05fu-mqjb-zca8-6d3c-e9xx"  # <- Su clave RTMP

# Generar lista aleatoria de canciones
find canciones/ -type f -name "*.mp3" > playlist.txt
shuf playlist.txt > playlist_loop.txt

# Emitir fondo.jpg con música en bucle
ffmpeg -re \
  -loop 1 -framerate 2 -i fondo.jpg \
  -f concat -safe 0 -i <(for f in $(cat playlist_loop.txt); do echo "file '$PWD/$f'"; done) \
  -c:v libx264 -preset veryfast -tune stillimage -pix_fmt yuv420p \
  -c:a aac -b:a 160k -ar 44100 \
  -f flv "$STREAM_URL/$STREAM_KEY"
