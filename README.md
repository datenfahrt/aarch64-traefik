# Traefik Reverse Proxy / docker aarch64 alpine

Use on my odroid c2 with dnsmasq (not included)

* Traefik Version v1.2.3 / morbier & Docker Backend
* Build Infos @ https://datenfahrt.org/wiki/linux/odroid-c2/docker/traefik
* Dockerfile @ https://github.com/datenfahrt/aarch64-traefik
* Config File @ https://github.com/datenfahrt/aarch64-traefik/blob/master/config.toml

* dnsmasq for aarch64 @ https://hub.docker.com/r/datenfahrt/aarch64-dnsmasq/

## About Traefik:

* https://traefik.io/
* https://github.com/containous/traefik
* https://docs.traefik.io/
* config.toml @ https://docs.traefik.io/toml/

### Run
```
docker run -d --name traefik -p 8080:8080 -p 80:80 -p443:443 -v /var/run/docker.sock:/var/run/docker.sock datenfahrt/aarch64-traefik
```


