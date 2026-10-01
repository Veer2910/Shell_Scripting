# 176156_Veer_Shell_Scripting_13_T002
# Author: Veer Bhalodia
# Description: Tracks and logs user login and logout events to a specified file.

#!/bin/bash

source ./common.sh

while true
do

    echo "Enter the log file path:"
    read log_file

    if [ -z "$log_file" ]
    then
        echo "output file path not empty"

    elif [[ "$log_file" != *.log ]]
    then
        echo "Enter valid file type"

    else
        log_file="${log_file/#\~/$HOME}"
        directory=$(dirname "$log_file")

        if [ ! -d "$directory" ]
        then
            echo "invalid file path"
        else
            last -F > "$log_file"
            echo "User login/logout tracking complete."
            echo "Data saved to ${log_file/#$HOME/\~}."
        fi
    fi

    if ! run_again
    then
        break
    fi

done