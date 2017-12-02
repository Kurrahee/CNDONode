#!/bin/bash

trap "exit 1" TERM
PATH="`dirname \"$0\"`"
PATH="`( cd \"$PATH\" && pwd )`"
#echo "$PATH"

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
    cp -r "$PATH/.DeepOnion" ~/
else
    yes | cp "$PATH/.DeepOnion/DeepOnion.conf" $ONIONDIR
fi

yes | cp "$PATH/DeepOniond" /usr/bin
yes | cp "$PATH/do-proxy" /usr/bin
yes | cp "$PATH/DeepOniond.service" /etc/systemd/system/

log "启动DeepOniond"
sudo systemctl daemon-reload >/dev/null 2>&1
sudo systemctl enable DeepOniond >/dev/null 2>&1
sudo systemctl start DeepOniond >/dev/null 2>&1

# systemctl status DeepOniond