#!/bin/bash

echo """
========================================================
============           My simple checker 
============             @BlacKnight
========================================================
||
||  choose mode :: press:
||      
||      1 - for files 
||      2 - for folders (dirs)
||
||
"""

read mode

if [ $mode -eq 1 ]; then 
    echo "Enter file path : "
    read file
    if [ -f $file ]; then 
        echo "file exist"
    else 
        echo "file not exist"
    fi
elif [ $mode -eq 2 ]; then
    echo "Enter dir path : "
    read dir
    if [ -d $dir ]; then 
        echo "dir exist"
    else 
        echo "dir not exist"
    fi
else 
    echo "Invalid option : terminating now"
fi


