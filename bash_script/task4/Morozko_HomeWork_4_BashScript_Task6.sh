#!/bin/bash

while read filedirect
do 
    if [ "${filedirect: -1}" = "/" ]
        then 
            mkdir -p "${filedirect}"
        else 
            touch "${filedirect}"
    fi
done