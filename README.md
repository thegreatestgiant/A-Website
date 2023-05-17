# A-Website

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
docker run -itd -p 80:80 -p 8080:8080 --name swamp swarm
```

## Extensions used
 - Bracket Pair Colorzer 2
 - Code Spell Check
 - Docker
 - Error Lens
 - Indent-rainbow
 - live-server
 - Prettier
 - Vscode-icons
 - Xcode-Theme

### You can view this on docker hub if you want
[docker hub](https://hub.docker.com/r/thegreatestgiant/website)
