FROM datenfahrt/aarch64-alpine:3.6.2

MAINTAINER Haiko 

ENV APPVERSION "v1.4.1" 

RUN apk --update --no-cache add curl tzdata && \
    cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime && \
    mkdir -p /app/cert /app/log && \
    curl -L -o /usr/local/bin/traefik https://github.com/containous/traefik/releases/download/${APPVERSION}/traefik_linux-arm64 && \
    chmod +x /usr/local/bin/traefik && \
    ln -sf /dev/stdout /app/log/access.log && \
    ln -sf /dev/stderr /app/log/traefik.log
    
COPY ./config.toml /app/config.toml
COPY ./cert /app/cert

WORKDIR /app

EXPOSE 8080/tcp 80/tcp 443/tcp

ENTRYPOINT ["traefik"]

CMD ["-c","/app/config.toml"]


