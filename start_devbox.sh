#!/bin/bash
docker rm devbox
docker run --name devbox -it --mount type=tmpfs,destination=/ramdisk --detach-keys="ctrl-@" -v ~/workdir:/home/pultti/workdir -v /var/run/docker.sock:/var/run/docker.sock devbox
