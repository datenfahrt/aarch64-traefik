FROM datenfahrt/aarch64-alpine

MAINTAINER haiko hall <haiko.hall@gmail.com>

ENV APPVERSION "v1.2.0-rc1" 

RUN apk --update --no-cache add curl tzdata

RUN cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime

RUN mkdir -p /app/cert /app/log 

RUN curl -L -o /app/traefik https://github.com/containous/traefik/releases/download/$APPVERSION/traefik_linux-arm64 && chmod +x /app/traefik

RUN touch /app/log/access.log && touch /app/log/traefik.log

COPY ./config.toml /app/config.toml
COPY ./cert /app/cert

RUN ln -sf /dev/stdout /app/log/access.log
#RUN ln -sf /dev/stderr /app/log/traefik.log

WORKDIR /app

EXPOSE 8080/tcp 80/tcp 443/tcp

ENTRYPOINT ["./traefik","-c","/app/config.toml"]