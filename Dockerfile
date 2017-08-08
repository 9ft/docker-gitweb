FROM nginx
MAINTAINER Mindy Cong <mindycong@gmail.com>

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
    apt-get install -y gitweb fcgiwrap apache2-utils && \
    rm -rf /var/lib/apt/lists/*

COPY ./command/addrepo /usr/bin/addrepo
COPY ./command/rmrepo /usr/bin/rmrepo
RUN chmod +x /usr/bin/addrepo && \
    chmod +x /usr/bin/rmrepo

ADD ./entrypoint /entrypoint
RUN chmod +x /entrypoint
ENTRYPOINT ["/entrypoint"]
