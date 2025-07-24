FROM woahbase/alpine-rsyslog

RUN set -xe \
    && apk add --no-cache --purge -uU net-snmp\
    && mkdir -p /mibs \
    && rm -rf /var/cache/apk/* /tmp/*

COPY root/defaults/ /defaults/
COPY etc/ /etc/

EXPOSE 162/udp

ENTRYPOINT ["/init"]