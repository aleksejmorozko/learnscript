#!/bin/bash
gawk '/,|"[^"]*",/ '  accounts.csv 
# awk 'BEGIN {FS=",[^ ]"} {print $6}' accounts.csv 


# awk '
#     # define the content with FPAT
#     # here any non , or a encapsulate quoted content
#     BEGIN{ FPAT = "[^,]*|\"[^\"]*\"" }
#
#     # for showing each field
#     {for (i=1;i<=NF;i++) printf( "field %d: %s\n", i, $i)} ' accounts.csv 

#cat accounts.csv | csvtool col 4 -