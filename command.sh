#!/bin/bash

# remove compiled files and previous modules
rm -rf /data/yakyak/app
rm -rf /data/yakyak/node_modules

# fetch latest yakyak
git fetch
git checkout origin/master

# checkout $TAG if it exists, otherwise keeps origin/master
git checkout $TAG

# install modules
npm install

# build packages
xvfb-run npm run deploy

# all permissions are set to 1000 user (default in linux)
#  this is not important
chown -R 1000:1000 dist/*
