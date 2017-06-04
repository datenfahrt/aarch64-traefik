FROM datenfahrt/aarch64-alpine:3.6.1

MAINTAINER Haiko <haiko@datenfahrt.org>

ENV APPVERSION "v1.3.0" 

RUN apk --update --no-cache add curl tzdata

RUN cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime

RUN mkdir -p /app/cert /app/log 

RUN curl -L -o /app/traefik https://github.com/containous/traefik/releases/download/$APPVERSION/traefik_linux-arm64 && chmod +x /app/traefik

RUN touch /app/log/access.log && touch /app/log/traefik.log

COPY ./config.toml /app/config.toml
COPY ./cert /app/cert

RUN ln -sf /dev/stdout /app/log/access.log
RUN ln -sf /dev/stderr /app/log/traefik.log

WORKDIR /app

EXPOSE 8080/tcp 80/tcp 443/tcp

ENTRYPOINT ["./traefik","-c","/app/config.toml"]
