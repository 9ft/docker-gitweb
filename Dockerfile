FROM nginx
MAINTAINER Mindy Cong <mindycong@gmail.com>

RUN apt-get update && \
    apt-get install -y gitweb fcgiwrap && \
    rm -rf /var/lib/apt/lists/*

ADD ./entrypoint /entrypoint
RUN chmod +x /entrypoint
ENTRYPOINT ["/entrypoint"]
