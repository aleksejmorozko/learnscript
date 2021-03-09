#!/bin/bash
# output jesus variable with replacement all words from water to wine with one-line command
jesus="water wine water wine water wine"
echo ${jesus//water/wine}