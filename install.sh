#!/bin/bash

trap "exit 1" TERM
PWD="`dirname \"$0\"`"
PWD="`( cd \"$PWD\" && pwd )`"
#echo "$PWD"

ONIONDIR="~/.DeepOnion"

log()
{
    echo 1>&2 "$1"
}

log "Stop DeepOniond"
sudo systemctl stop DeepOniond >/dev/null 2>&1
sudo systemctl stop DOProxy >/dev/null 2>&1

log "Install Lib"
yum -y install boost-devel openssl-devel libevent-devel  miniupnpc-devel libdb-cxx-devel >/dev/null 2>&1

log "Install DeepOniond"
if [ ! -d "$ONIONDIR" ];
then
    cp -r "${PWD}/.DeepOnion" ~/
else
    yes | cp "${PWD}/.DeepOnion/DeepOnion.conf" $ONIONDIR
fi

yes | cp "${PWD}/DeepOniond" /usr/bin
yes | cp "${PWD}/do-proxy" /usr/bin
yes | cp "${PWD}/DeepOniond.service" /etc/systemd/system/
yes | cp "${PWD}/DOProxy.service" /etc/systemd/system/

log "Start DeepOniond"
sudo systemctl daemon-reload >/dev/null 2>&1
sudo systemctl enable DeepOniond >/dev/null 2>&1
sudo systemctl enable DOProxy >/dev/null 2>&1
sudo systemctl start DeepOniond >/dev/null 2>&1
sudo systemctl start DOProxy >/dev/null 2>&1

# systemctl status DeepOniond
# systemctl status DOProxy