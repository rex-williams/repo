#!/bin/sh
{
    git add .
    git commit -m "$(clock)"
    git push
} &
{
doas cp -rfvu ./* /mnt/var/db/pkg/repo
} &
wait
