FROM  debian:stable-slim as builder

COPY build.sh /tmp/build.sh

RUN bash /tmp/build.sh

FROM debian:stable-slim

COPY --from=builder /usr/bin/fah-node /usr/bin/fah-node
COPY init.sh /usr/bin/fah-node-init

RUN apt-get update && \
    apt-get -y install curl && \
    groupadd -g 19000 fah-node && \
    adduser --uid 19000 --gid 19000 --home /var/lib/fah-node --quiet fah-node && \
    mkdir -p /var/lib/fah-node && \
    chown -R fah-node:fah-node /var/lib/fah-node && \
    chmod 755 /usr/bin/fah-node-init && \
    chmod 755 /usr/bin/fah-node

WORKDIR /var/lib/fah-node

CMD ["/usr/bin/fah-node-init"]

EXPOSE 8080