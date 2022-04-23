FROM alpine:latest
WORKDIR /app

RUN apk add --update --no-cache docker

COPY ./action-entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

COPY ./ /app

ENTRYPOINT ["/entrypoint.sh"]
