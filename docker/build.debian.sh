#!/bin/bash

# fetch latest release tag
CHATGPT_ON_WECHAT_TAG=`curl -sL "https://api.github.com/repos/gogooing/future-wechat/releases/latest" | \
     grep '"tag_name":' | \
     sed -E 's/.*"([^"]+)".*/\1/'`

# build image
docker build -f Dockerfile.debian \
             --build-arg CHATGPT_ON_WECHAT_VER=$CHATGPT_ON_WECHAT_TAG \
             -t gogooing/future-wechat .

# tag image
docker tag gogooing/future-wechat gogooing/future-wechat:debian
docker tag gogooing/future-wechat gogooing/future-wechat:$CHATGPT_ON_WECHAT_TAG-debian