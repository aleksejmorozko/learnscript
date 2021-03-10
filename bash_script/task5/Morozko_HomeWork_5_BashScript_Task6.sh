#!/bin/bash

if [[ -z $(ps -ef | grep "[s]leep 1000") ]]; then
        sleep 1000 & &> /dev/null
fi

#--for i in $(ps -ef | grep "[s]leep 1000" | awk '{print $2}'); do kill $i; done