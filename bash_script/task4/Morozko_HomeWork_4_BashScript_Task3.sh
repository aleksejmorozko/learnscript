#!/bin/bash

array=$(seq 1 100)
for i in $array; do
    if (($(expr $i % 2) == 0)); then
        if (($i < 85)); then
            if (($i < 30)) || (($i > 60)); then
                echo -n \ $i
            fi
        fi
    fi
done
echo
