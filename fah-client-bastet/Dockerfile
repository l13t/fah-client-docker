FROM debian:stable-slim as builder

# fahclient version
ARG CLIENT_VERSION=8.3.1
ARG CLIENT_SOURCE=alpha # Possible values: alpha, beta, public

RUN apt-get update && \
    apt-get install -y curl debconf-utils

WORKDIR /root

COPY build.sh /root/build.sh
RUN bash /root/build.sh ${CLIENT_VERSION} ${CLIENT_SOURCE}

FROM node:21-alpine as ui-builder

ARG CLIENT_VERSION=8.3.1

WORKDIR /app

RUN apk add --no-cache git && \
    chown node:node /app

RUN git clone https://github.com/FoldingAtHome/fah-web-client-bastet.git . && \
    git config --global --add safe.directory /app && \
    git checkout "v${CLIENT_VERSION}" && \
    npm install && \
    npm run build

FROM debian:stable-slim
LABEL maintainer="liet@liet.kiev.ua"
LABEL org.opencontainers.image.description="Folding@Home client with web interface"
LABEL org.opencontainers.image.source="https://github.com/liet/fah-client-bastet"

ENV FOLD_USER='Anonymous' \
    FOLD_PASSKEY='' \
    FOLD_TEAM=0 \
    FOLD_ALLOW_IP='' \
    FOLD_ON_IDLE=false

USER root

COPY --from=builder /usr/bin/fah-client /usr/bin/
COPY --from=builder /etc/ssl /etc/ssl
COPY --from=ui-builder /app/dist /opt/fah-client/web

RUN groupadd -g 19000 fah-client && \
    adduser --uid 19000 --gid 19000 --home /var/lib/fah-client --quiet fah-client

COPY init.sh /usr/bin/fah-client-init
RUN chmod +x /usr/bin/fah-client-init

USER fah-client
WORKDIR /var/lib/fah-client

CMD /usr/bin/fah-client-init

EXPOSE 7396
