FROM ubuntu:22.04

RUN apt update && apt install -y ffmpeg

COPY canciones/ /app/canciones/
COPY fondo.mp4 playlist.txt emitir.sh /app/

WORKDIR /app
CMD ["bash", "emitir.sh"]
