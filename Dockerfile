FROM alpine:3.14

ADD ./tor-socat.sh /
ADD ./torrc /etc/tor/torrc

RUN apk update \
	&& apk upgrade  \
	&& apk add tor socat \
	&& rm -rf /var/cache/apk/* \
	&& chmod +x /tor-socat.sh

EXPOSE ${TCP_LISTEN_PORT}

ENTRYPOINT ["/tor-socat.sh"]
