# 176156_Veer_Shell_Scripting_8_T002
# Author: Veer Bhalodia
# Description: Checks the size of a directory and warns if it exceeds the specified limit.

#!/bin/bash

source ./common.sh

while true
do

    echo "Enter the directory"
    read dir

    dir=$(convert_path "$dir")

    if check_directory "$dir"
    then
        echo "Directory does not exist."

    else
        size=$(du -m "$dir" | awk '{print $1}')

        echo "The size of the directory $dir is ${size}MB."

        if [ "$size" -gt 100 ]
        then
            echo "The size exceeds the 100MB limit!"
        else
            echo "The size is within the 100MB limit."
        fi
    fi

    if ! run_again
    then
        break
    fi

done