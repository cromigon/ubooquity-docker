![Ubooquity Logo](http://i.imgur.com/InPPMtr.png)

# Introduction

This is my take on an docker image for Ubooquity. @cromignon has made an image for us in his [docker-containers repository](https://github.com/cromigon/ubooquity-docker)*.
but doesn't seems to maintain it anymore.

So I made this image based based on his own, but with Ubooquity v2.
It relies on you mounting directories for ubooquity data and for the comics (instructions below).


## About Ubooquity

Home server for comics and ebooks

Ubooquity is a free, lightweight and easy-to-use home server for your comics and ebooks. Use it to access your files from anywhere, with a tablet, an e-reader, a phone or a computer.

Main features
* Simple graphical interface to configure your server in a few minutes
* Web administration page available if you prefer to do everything through your browser
* User management with secured access, to decide who can see what
* Online comic reader to read your comics without downloading huge files
* Compatible with Calibre metadata, for better ebooks collection management
* Can be installed on any OS supporting Java (Windows, Linux, Mac OS...) and on a wide range of hardware (desktop computer, server, NAS...)
* Supports many types of files, with a preference for epub, cbz, cbr and PDF files

Copy-pasted from the Ubooquity homepage.

# Getting started

## Prerequisite

Ensure that you have folders created for the ubooquity data on the host.
It's generally recommended to have some e-books or comics to mount in.

## Docker

Run the following command line :

```
docker run --rm -ti -v /PATH/TO/UBOOQUITY/DATA:/config -v /PATH/TO/COMICSANDBOOKS:/media -p 2202:2202 -p 2502:2502 zerpex/ubooquity
```
Now go into http://{YOUR_IP_ADDRESS}:2502/admin and do your configuration in accordance to the ubooquity documentation.
Then, you can access Ubooquity through http://{YOUR_IP_ADDRESS}:2202

## Docker-compose

Use the following docker-compose.yml and adapt it to you configuration :

```
ubooquity:
  restart: always
  image: zerpex/ubooquity-docker
  container_name: ubooquity
  volumes:
    - ./files/conf:/conf
    - /home/library:/media
    - /etc/localtime:/etc/localtime:ro
  environment:
    - TZ=Europe/Paris
  ports:
    - 2202:2202
    - 2502:2502

```

Now go into http://{YOUR_IP_ADDRESS}:2502/admin and do your configuration in accordance to the ubooquity documentation.
Then, you can access Ubooquity through http://{YOUR_IP_ADDRESS}:2202


# License

Code released under the [MIT license](./LICENSE).
