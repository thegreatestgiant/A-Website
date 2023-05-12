FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    tzdata && \
    ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    apt-get install -y nginx ssh zip unzip curl nano php-fpm && \
    rm -rf /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

RUN mkdir -p /sites/default && touch /sites/default/index.html
COPY default /etc/nginx/sites-available/default
RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
RUN ln -s /etc/nginx /settings

COPY port /usr/bin/port
COPY new-site /usr/bin/new-site
RUN chmod +x /usr/bin/port /usr/bin/new-site

RUN ARCH=$(if [ $(uname -m) = "aarch64" ]; then echo "arm64"; elif [ $(uname -m) = "x86_64" ]; then echo "amd64"; else echo $(uname -m); fi) && \
    curl -fOL https://github.com/coder/code-server/releases/download/v4.12.0/code-server_4.12.0_${ARCH}.deb
RUN dpkg -i code-server_4.12.0*.deb
RUN rm code-server*
COPY code-server /root/.local/share/code-server

CMD ["sh", "-c", "service php8.1-fpm start; nginx -g 'daemon off;' & code-server --auth none --host 0.0.0.0"]
