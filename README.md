# A-Website

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