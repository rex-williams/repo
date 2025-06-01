#!/bin/sh
{
    git add .
    git commit -m "$(clock)"
    git push
} &
doas cp -fv ./* /mnt/var/db/pkg/repo &
wait
