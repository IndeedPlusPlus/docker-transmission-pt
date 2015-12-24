docker-transmission-pt
===================

Transmission Daemon 2.03 Docker Container

We use version 2.03 because many PT(Private Tracker) sites, especially those used by some universities, are not well implemented and require transmission no newer than 2.03 to prevent some issues counting upload and download.

Application container, don't forget to specify a password for `transmission` account and local directory for the downloads:

```
    docker run -d --name transmission \
    -p 12345:12345 -p 12345:12345/udp -p 9091:9091 \
    -e ADMIN_PASS=password \
    -e EXTRA_FLAGS='--no-dht --no-lpd' \
    -v /local/dir/downloads:/var/lib/transmission-daemon/downloads \
    -v /local/dir/incomplete:/var/lib/transmission-daemon/incomplete \
    -v /local/dir/resume:/etc/transmission-daemon/resume \
    -v /local/dir/torrents:/etc/transmission-daemon/torrents \
    indeedplusplus/docker-transmission-pt
```
