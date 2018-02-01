![Ubooquity Logo](http://i.imgur.com/InPPMtr.png)

# Notice - Unmaintained

This repository is unmaintained due to me not having the time to take care of it.

[@zerpex](https://github.com/zerpex) has done an amazing job in working on Ubooquity v2 in his repository [zerpex/ubooquity-docker](https://github.com/zerpex/ubooquity-docker)

I suggest that you check that out if you want a more modern version.

I am going to leave this repository up, but archived so feel free to fork if you want to do something based upon it.
Thank you for showing an interest in this repository!

# Introduction

This is my take on an docker image for Ubooquity. @hurricanehrndz has made an image for us in his [docker-containers repository](https://github.com/hurricanehrndz/docker-containers)*.
I felt that this wasn't entirely to my liking. Mostly because it's in an OS that I don't completely understand.

So I made this image based on Alpine Linux to keep it somewhat minimalistic, it's been running on my own server for a while now and I haven't run into any obvious problems.
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

## First run

Since the container doesn't come with any settings pre-done, we need to start it with the webadmin module enabled.
I would recommend to do this in an disposable container.

```
docker run --rm -ti -v /PATH/TO/COMICSANDBOOKS:/opt/data -p 2202:2202 cromigon/ubooquity:latest -webadmin
```

Or if you want to save the ubooquity service data to a specific folder and not the auto generated volume,

```
docker run --rm -ti -v /PATH/TO/UBOOQUITY/DATA:/opt/ubooquity-data -v /PATH/TO/COMICSANDBOOKS:/opt/data -p 2202:2202 cromigon/ubooquity:latest -webadmin
```

Now go into http://{YOUR_IP_ADDRESS}:2202/admin and do your configuration in accordance to the ubooquity documentation.

Exit the container when you are done, since we don't want to leave the webadmin running, if you need it again in the future, just stop the running container, run the above command again and log-in to the admin panel.

## Second run

Now we've come to the part when we're going to run the long-running container. It's recommended (by me) to don't have it running with the webadmin part enabled. I also like to run my long-running containers have the restart=unless-stopped flag enabled.

```
docker run --restart=unless-stopped -d -v /PATH/TO/COMICSANDBOOKS:/opt/data -p 2202:2202 cromigon/ubooquity:latest
```

Or if you're not using the auto-generated volume

```
docker run --restart=unless-stopped -d -v /PATH/TO/UBOOQUITY/DATA:/opt/ubooquity-data -v /PATH/TO/COMICSANDBOOKS:/opt/data -p 2202:2202 cromigon/ubooquity:latest
```

Now if you want to install themes or such, just put them in the themes folder in the ubooquity-data folder.


# License

Code released under the [MIT license](./LICENSE).
