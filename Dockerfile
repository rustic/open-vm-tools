FROM alpine:latest

RUN apk add --no-cache \
    open-vm-tools \
    && rm -rf /var/cache/apk/*

CMD ["/usr/bin/vmtoolsd"]