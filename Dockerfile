FROM alpine:3.1

ENV NGINX_VERSION="1.14.0"
ENV NGINX_SHA="016ab1a12c9a0c9444f9073e4300223ffd6fadbe"

RUN apk --update add \
    git \
    openssl-dev \
    pcre-dev \
    zlib-dev \
    wget \
    perl \
    perl-dev \
    imagemagick \
    imagemagick-dev \
    build-base

#ADD build.sh /tmp/build.sh
#RUN sh /tmp/build.sh \
#    rm /tmp/build.sh

RUN mkdir -p /var/nginx/cache
#ADD files/nginx.conf /etc/nginx/nginx.conf
#WORKDIR /etc/nginx

EXPOSE 80 443

ENV OMP_NUM_THREADS=1
ENV GIT_SHA="<%= `git rev-parse HEAD`.strip %>"

CMD ["nginx", "-g", "daemon off;"]
