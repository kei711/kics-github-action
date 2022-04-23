FROM alpine:latest

RUN apk add --update --no-cache docker

COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

COPY . /kics-action

ENTRYPOINT ["/entrypoint.sh"]
