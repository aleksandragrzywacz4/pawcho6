#syntax=docker/dockerfile:1

#pobieranie kodu przez SSH
FROM alpine AS builder
RUN apk add --no-cache git openssh-client git

#konfiguracja
RUN mkdir -p -m 0700 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts

#pobieranie kodu z repo
RUN --mount=type=ssh git clone git@github.com:aleksandragrzywacz4/pawcho6.git /src

#Etap 2
FROM nginx:alpine
LABEL org.opencontainers.image.source="https://github.com/aleksandragrzywacz4/pawcho6"
LABEL org.opencontainers.image.authors="Aleksandra Grzywacz"

RUN apk add --no-cache curl

ARG VERSION="lab6"
ENV APP_VERSION=$VERSION

COPY --from=builder /src/index.html /usr/share/nginx/html/index.html

RUN echo 'sed -i "s/##IP##/$(hostname -i)/g" /usr/share/nginx/html/index.html && \
          sed -i "s/##HOSTNAME##/$(hostname)/g" /usr/share/nginx/html/index.html && \
	  sed -i "s/##VERSION##/'"$APP_VERSION"'/g" /usr/share/nginx/html/index.html && \
          nginx -g "daemon off;"' > /entrypoint.sh && chmod +x /entrypoint.sh

HEALTHCHECK --interval=10s --timeout=3s \
	CMD curl -f http://localhost/ || exit 1
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
