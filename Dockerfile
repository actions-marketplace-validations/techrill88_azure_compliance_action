FROM alpine:3.10

COPY app/index.sh /index.sh

ENTRYPOINT ["/index.sh"]