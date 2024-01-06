FROM debian:stable-slim as builder

# fahclient version
ARG CLIENT_VERSION=8.1.18
ARG CLIENT_SOURCE=beta # Possible values: alpha, beta, public

RUN apt-get update && \
    apt-get install -y curl debconf-utils

WORKDIR /root

COPY build.sh /root/build.sh
RUN bash /root/build.sh ${CLIENT_VERSION} ${CLIENT_SOURCE}

#############################################
# Multi-stage build to trim down image size #
#############################################
FROM debian:stable-slim
LABEL maintainer="liet@liet.kiev.ua"

ENV FOLD_USER='' \
    FOLD_PASSKEY='' \
    FOLD_TEAM=0 \
    FOLD_ALLOW_IP=''

USER root

COPY --from=builder /usr/bin/fah-client /usr/bin/
COPY --from=builder /etc/ssl /etc/ssl

RUN useradd -ms /bin/bash fah-client -u 19000

RUN mkdir -p /opt/fah-client && \
    chown -R fah-client:fah-client /opt/fah-client
COPY init.sh /opt/fah-client/init.sh
RUN chmod +x /opt/fah-client/init.sh

USER fah-client
WORKDIR /opt/fah-client

CMD /opt/fah-client/init.sh

EXPOSE 7396
EXPOSE 36330
