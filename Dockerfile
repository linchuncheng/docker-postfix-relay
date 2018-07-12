FROM alpine:3.4
MAINTAINER Alex Simenduev <shamil.si@gmail.com>

# install required packages
RUN apk --no-cache add ca-certificates gettext postfix rsyslog supervisor

# copy required files
COPY usr/local/bin/ /usr/local/bin/
COPY root/conf/ /root/conf/
COPY entrypoint.sh /

# prepare configuration files
RUN ln -fs /root/conf/rsyslog.conf /etc/rsyslog.conf \
    && ln -fs /root/conf/supervisord.conf /etc/supervisord.conf

ENV TZ Asia/Shanghai

EXPOSE 25
ENTRYPOINT ["/entrypoint.sh"]
