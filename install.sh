#!/bin/bash

trap "exit 1" TERM
ONIONDIR="~/.DeepOnion"

log()
{
    echo 1>&2 "$1"
}

log "停止DeepOniond"
sudo systemctl stop DeepOniond >/dev/null 2>&1
sleep 1

log "安装库文件"
yum -y install boost-devel openssl-devel libevent-devel  miniupnpc-devel libdb-cxx-devel >/dev/null 2>&1

log "更新DeepOniond"
if [ ! -d "$ONIONDIR" ];
then
    cp -r .DeepOnion/ ~/
else
    yes | cp .DeepOnion/DeepOnion.conf $ONIONDIR
fi

yes | cp ./DeepOniond /usr/bin
yes | cp ./do-proxy /usr/bin
yes | cp ./DeepOniond.service /etc/systemd/system/

log "启动DeepOniond"
sudo systemctl daemon-reload >/dev/null 2>&1
sudo systemctl enable DeepOniond >/dev/null 2>&1
sudo systemctl start DeepOniond >/dev/null 2>&1

# systemctl status DeepOniond