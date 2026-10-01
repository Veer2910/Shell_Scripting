# 176156_Veer_Shell_Scripting_9_T002
# Author: Veer Bhalodia
# Description: Searches for a specified file recursively in the given directory.

#!/bin/bash

source ./common.sh

while true
do

    echo "Enter the file name:"
    read filename

    echo "Enter the directory:"
    read directory

    if check_blank "$filename"
    then
        echo "file name cannot be empty"

    elif check_blank "$directory"
    then
        echo "directory name can not be empty"

    else
        directory=$(convert_path "$directory")

        if check_directory "$directory"
        then
            echo "the directory $directory does not exists"

        else
            result=$(find "$directory" -type f -name "$filename")

            if [ -n "$result" ]
            then
                echo "Found $filename at: $result"
            else
                echo "file $filename not found in $directory"
            fi
        fi
    fi

    if ! run_again
    then
        break
    fi

done