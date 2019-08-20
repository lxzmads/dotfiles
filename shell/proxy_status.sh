#!/usr/bin/env bash

if [[ -n $http_proxy ]];then
    echo -e "Proxy: on"
else
    echo "Proxy: off"
fi
