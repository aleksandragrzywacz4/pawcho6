FROM alpine:latest AS builder

ARG VERSION
ENV APP_VERSION=$VERSION

WORKDIR /app

RUN echo "<html><body>" > index.html && \
    echo "<h1>Informacje o serwerze</h1>" >> index.html && \
    echo "<p><b>Adres IP:</b> ##IP##</p>" >> index.html && \
    echo "<p><b>Nazwa serwera:</b> ##HOSTNAME##</p>" >> index.html && \
    echo "<p><b>Wersja aplikacji:</b> $APP_VERSION</p>" >> index.html && \
    echo "</body></html>" >> index.html

FROM nginx:alpine

RUN apk add --no-cache curl

COPY --from=builder /app/index.html /usr/share/nginx/html/index.html

RUN echo 'sed -i "s/##IP##/$(hostname -i)/g" /usr/share/nginx/html/index.html && \
          sed -i "s/##HOSTNAME##/$(hostname)/g" /usr/share/nginx/html/index.html && \
          nginx -g "daemon off;"' > /entrypoint.sh && chmod +x /entrypoint.sh

HEALTHCHECK --interval=10s --timeout=3s \
	CMD curl -f http://localhost/ || exit 1
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
