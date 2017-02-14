#!/bin/bash

if [ "$1" = "$2" ]; then 
    echo "indeed equal"
    echo $1
    echo $2
else 
    echo "not equal"
    echo $1
    echo $2
fi
