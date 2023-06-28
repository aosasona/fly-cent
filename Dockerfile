FROM alpine:latest

RUN apk --no-cache upgrade && apk --no-cache add ca-certificates

COPY --from=centrifugo/centrifugo:v4 /usr/local/bin/centrifugo /usr/bin/centrifugo

COPY centrifugo_config.json /etc/centrifugo_config.json

EXPOSE 8000

CMD ["centrifugo", "--config=/etc/centrifugo_config.json"]
