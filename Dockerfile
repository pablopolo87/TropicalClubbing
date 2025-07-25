FROM ubuntu:22.04

RUN apt update && apt install -y ffmpeg

COPY Canciones/ /app/canciones/
COPY fondo.jpg playlist.txt emitir.sh /app/

WORKDIR /app
CMD ["bash", "emitir.sh"]
