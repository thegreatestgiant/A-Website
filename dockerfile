FROM debian:11-slim

# Set DEBIAN_FRONTEND to noninteractive to suppress debconf messages
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get install -y \
    ca-certificates \
    nginx \
    ssh \
    zip \
    unzip \
    curl \
    nano \
    php-fpm \
    jq \
    certbot \
    python3-certbot-nginx && \
    ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime && \
    ln -s /var/www/html /sites
# Configure Nginx
RUN rm -f /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default && \
    mkdir -p /sites/default && touch /sites/default/index.html

RUN VER=$(curl -sX GET "https://api.github.com/repos/coder/code-server/releases/latest" | jq -r .tag_name | sed 's/v//') && \
    ARCH=$(if [ $(uname -m) = "aarch64" ]; then echo "arm64"; elif [ $(uname -m) = "x86_64" ]; then echo "amd64"; else echo $(uname -m); fi) && \
    curl -fOL https://github.com/coder/code-server/releases/download/v${VER}/code-server_${VER}_${ARCH}.deb && \
    dpkg -i code-server_${VER}_${ARCH}.deb && \
    rm code-server_${VER}_${ARCH}.deb

# Copy custom scripts to /usr/bin
COPY --chmod=755 spoof /usr/bin
COPY --chmod=755 port /usr/bin/port
COPY --chmod=755 new-site /usr/bin/new-site

# Copy Nginx default site configuration
COPY default /etc/nginx/sites-available/default

# Copy your Code-Server configuration and extensions
ADD code-server.tar.gz /root/.local/share

# Create symbolic links for Nginx config, settings, and code-server settings
RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default && \
    ln -s /etc/nginx /settings && \
    ln -s /root/.local/share/code-server /code-settings

# Add volumes
VOLUME /settings /sites /code-settings

# Expose the default ports
EXPOSE 80 8080

# Start PHP-FPM, Nginx, and Code-Server
CMD ["sh", "-c", "service php8.1-fpm start; nginx -g 'daemon off;' & code-server --auth none --host 0.0.0.0"]