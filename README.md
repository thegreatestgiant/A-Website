# A-Website

## Deploying

### Regular Website
```sh
version: '3'
services:
  website:
    restart: always
    container_name: a-website
    ports:
     - 8080:8080
     - 600:600
    volumes:
      - web-code:/root/.local/share/code-server
      - web-sites:/sites
      - web-st-av:/etc/nginx/sites-available
      - web-st-en:/etc/nginx/sites-enabled
    image: thegreatestgiant/website
volumes:
  web-code:
  web-sites:
  web-st-av:
  web-st-en:
```

### Swarm website
```sh
version: '3'
services:
  website:
    restart: always
    container_name: swarm
    network_mode: host
    image: thegreatestgiant/website:swarm
```

## Building from the Dockerfile
```sh
git clone https://github.com/thegreatestgiant/A-Website.git
cd A-Website
```

```sh
docker build -t website .
```

```sh
docker run -itd -p 600:600 -p 8080:8080 --name website website
```

### Building Swarm from the Dockerfile
```sh
git clone https://github.com/thegreatestgiant/A-Website.git
cd A-Website/swarm
```

```sh
docker build -t swarm .
```

```sh
docker run -itd --network host --name swamp swarm
```

## Extensions used
 - Bracket Pair Colorzer 2
 - Code Spell Check
 - Docker
 - Error Lens
 - Indent-rainbow
 - Live Server
 - Live Server (Five Server) 
 - Prettier
 - Vscode-icons
 - Xcode-Theme


### You can view this on docker hub if you want
[Docker Hub](https://hub.docker.com/r/thegreatestgiant/website)


# Updating
```
git clone https://github.com/thegreatestgiant/docker-calibre.git
```
