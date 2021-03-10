#!/bin/bash
user=$1
echo $(getent passwd $user) | cut -d : -f 6