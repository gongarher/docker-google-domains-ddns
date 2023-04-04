FROM alpine:latest

MAINTAINER Gonzalo García <gonzalo.garhtes@gmail.com>

RUN apk --update upgrade && \
    apk --no-cache add bash curl ca-certificates && \
    rm -rf /var/cache/apk/*

VOLUME ["/config"]

# Add dynamic dns script
ADD google-domains-ddns.sh /root/google-domains-ddns/google-domains-ddns.sh
RUN chmod +x /root/google-domains-ddns/google-domains-ddns.sh

# Create template config file
ADD google-domains-ddns.conf /root/google-domains-ddns/google-domains-ddns.conf

CMD ["/root/google-domains-ddns/google-domains-ddns.sh"]
