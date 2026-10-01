# 176156_Veer_Shell_Scripting_5_T002
# Author: Veer Bhalodia
# Description: Creates a compressed backup of all .txt files from the given directory.

#!/bin/bash

source ./common.sh

while true
do

    echo "Enter the directory path to back up:"
    read dir

    dir=${dir/#\~/$HOME}

    if [ -f "$dir" ]
    then
        echo "$(basename "$dir") is a file, not a directory."

    elif [ ! -d "$dir" ]
    then
        echo "Directory does not exist."

    else
        today=$(date +%Y-%m-%d)

        filename="backup_$today.tar.gz"

        cd "$dir"

        if ls *.txt >/dev/null 2>&1
        then
            tar -czf "$HOME/$filename" *.txt

            if [ $? -eq 0 ]
            then
                echo "Backup of .txt files from $dir has been created with the filename: $filename"
            else
                echo "Backup failed."
            fi
        else
            echo "Folder does not contain any .txt files."
        fi
    fi

    if ! run_again
    then
        break
    fi

done