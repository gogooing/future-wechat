#!/bin/bash

unset KUBECONFIG

cd .. && docker build -f docker/Dockerfile.latest \
             -t gogooing/future-wechat .

docker tag gogooing/future-wechat gogooing/future-wechat:$(date +%y%m%d)