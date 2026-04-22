# syntax=docker/dockerfile:1.3

#pobieranie kodu przez SSH
FROM alpine:latest AS dev_builder

ARG VERSION

RUN apk update && \
    apk upgrade && \
    apk add --no-cache nodejs npm openssh-client git && \
    rm -rf /etc/apk/cache

RUN npx create-react-app workspace_lab6

RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts

RUN --mount=type=ssh,id=s56git git clone git@github.com:aleksandragrzywacz4/pawcho6.git /cloned_repo && \
    cp /cloned_repo/index.html /workspace_lab6/src/index.html

WORKDIR /workspace_lab6

ENV REACT_APP_VERSION=${VERSION}

RUN npm install && npm run build

# syntax=docker/dockerfile:1.3
FROM nginx:mainline-alpine3.23 AS final_prod

LABEL org.opencontainers.image.version="$VERSION"
LABEL org.opencontainers.image.authors="Aleksandra Grzywacz"

RUN apk add --update --no-cache curl && rm -rf /etc/apk/cache

COPY --from=dev_builder /workspace_lab6/build/. /usr/share/nginx/html

EXPOSE 80

HEALTHCHECK --interval=10s --timeout=3s \
        CMD curl -f http://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]



