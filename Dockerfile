FROM ubuntu:14.04

MAINTAINER  Christopher Lyth <cjlyth@gmail.com>

RUN ["env", "DEBIAN_FRONTEND=noninteractive", "apt-get", "update", "-qqy"]
RUN ["env", "DEBIAN_FRONTEND=noninteractive", "apt-get", "install", "-qqy", "libfontconfig", "libfontconfig-dev", "libfreetype6-dev"]

ENV PHANTOMJS_VERSION 1.9.7
ENV PHANTOMJS_DOWNLOAD_FILE phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2
ENV PHANTOMJS_DOWNLOAD_URL http://bitbucket.org/ariya/phantomjs/downloads/$PHANTOMJS_DOWNLOAD_FILE

ADD $PHANTOMJS_DOWNLOAD_URL /tmp/downloads/

RUN tar xaf "/tmp/downloads/$PHANTOMJS_DOWNLOAD_FILE" \
	--transform "s/^[^\/]*/phantomjs/" \
	--directory /opt

RUN ["cp", "-rs", "/opt/phantomjs/bin", "/usr/"]

ENTRYPOINT ["/usr/bin/env", "phantomjs"]
CMD ["--help"]
