#!/bin/sh
{
    git add .
    git commit -m "$(clock)"
    git push
} &
{
doas rm -rf /mnt/var/db/pkg/repo/*
doas cp -rf ./* /mnt/var/db/pkg/repo
} &
wait
