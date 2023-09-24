# A-Website

## Use

- To deploy code-server with the extensions listed below
- To basically be a node where you can deploy many different sites from the same place, you can create a new site on the next port using the `new-site` command
- (supports php)
- A-Website can also be used for spoofing, for whatever site is running on port 80 (the default one) if you run `spoof [domain]` then you can add as many domains as you want to your spoofable website

## Deploying

```yml
version: "3.3"
services:
  website:
    restart: unless-stopped
    container_name: A-website
    network_mode: host
    volumes:
      - web-code:/code-settings
      - web-sites:/sites
      - web-settings:/settings
    image: thegreatestgiant/website:latest
volumes:
  web-code:
  web-sites:
  web-settings:
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
docker run -itd --network host --name A-Website website
```

## Extensions used

(If you have any suggestions please feel free to create an issue)

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
