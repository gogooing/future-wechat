#!/bin/bash

#关闭服务
cd `dirname $0`/..
export BASE_DIR=`pwd`
pid=`ps ax | grep -i app.py | grep "${BASE_DIR}" | grep python3 | grep -v grep | awk '{print $1}'`
if [ -z "$pid" ] ; then
        echo "No future-wechat running."
        exit -1;
fi

echo "The future-wechat(${pid}) is running..."

kill ${pid}

echo "Send shutdown request to future-wechat(${pid}) OK"
