# 176156_Veer_Shell_Scripting_6_T002
# Author: Veer Bhalodia
# Description: Checks whether the specified process is currently running.

#!/bin/bash

source ./common.sh

while true
do

    echo "Enter Process Name or PID:"
    read input

    if check_blank "$input"
    then
        echo "Invalid Input"

    else
        input=${input,,}

        if pgrep "$input" > /dev/null || ps -p "$input" > /dev/null
        then
            echo "The process $input is running."
        else
            echo "The process $input is not running."
        fi
    fi

    if ! run_again
    then
        break
    fi

done