#!/bin/bash

sudo systemctl start DeepOniond.service >/dev/null 2>&1
sudo systemctl start DOProxy.service >/dev/null 2>&1
