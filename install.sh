#!/bin/bash

trap "exit 1" TERM

yum -y install boost-devel openssl-devel libevent-devel  miniupnpc-devel libdb-cxx-devel

cp -r .DeepOnion/ ~/
cp ./DeepOniond /usr/bin
cp ./DeepOniond.service /etc/systemd/system/

sudo systemctl daemon-reload
sudo systemctl enable DeepOniond
sudo systemctl start DeepOniond