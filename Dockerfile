FROM nginx
MAINTAINER Mindy Cong <mindycong@gmail.com>

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
    apt-get install -y gitweb fcgiwrap apache2-utils && \
    rm -rf /var/lib/apt/lists/*

ADD ./command/addrepo /usr/bin/addrepo
ADD ./command/rmrepo /usr/bin/rmrepo
ADD ./command/addauth /usr/bin/addauth
ADD ./command/rmauth /usr/bin/rmauth

RUN chmod +x /usr/bin/addrepo && \
    chmod +x /usr/bin/rmrepo && \
    chmod +x /usr/bin/addauth && \
    chmod +x /usr/bin/rmauth

RUN cp /usr/share/gitweb/static/gitweb.js /gitweb.js

ADD ./entrypoint /entrypoint
RUN chmod +x /entrypoint
ENTRYPOINT ["/entrypoint"]
