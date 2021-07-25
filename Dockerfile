FROM alpine
LABEL maintainer="0x4f@tuta.io"
LABEL name="openTransmit"
# copy all files to docker image
COPY . .

RUN apk add --update \
    samba-common-tools \
    samba-client \
    samba-server \
    python3 \
    py3-pip \
    && rm -rf /var/cache/apk/*

VOLUME ["/etc", "/var/cache/samba", "/var/lib/samba", "/var/log/samba",\
        "/run/samba"]

ENTRYPOINT ["smbd", "--foreground", "--log-stdout", "--no-process-group"]
CMD []
