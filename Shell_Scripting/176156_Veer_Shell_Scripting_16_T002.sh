# 176156_Veer_Shell_Scripting_16_T002
# Author: Veer Bhalodia
# Description: Reads the kernel log and displays kernel panic and segmentation fault messages with timestamps.

#!/bin/bash

source ./common.sh

while true
do

    echo "Enter first fault:"
    read fault1

    echo "Enter second fault:"
    read fault2

    fault1=${fault1,,}
    fault2=${fault2,,}

    fault1=$(echo "$fault1" | xargs)
    fault2=$(echo "$fault2" | xargs)

    if check_blank "$fault1" && check_blank "$fault2"
    then
        echo "cannot take empty i/p"

    else
        if [ -n "$fault1" ]
        then
            if [ "$fault1" = "panic" ]
            then
                journalctl -k | grep -i "panic"

            elif [ "$fault1" = "segfault" ]
            then
                journalctl -k | grep -iE "segfault|segmentation fault"

            else
                echo "there is no fault $fault1"
            fi
        fi

        if [ -n "$fault2" ]
        then
            if [ "$fault2" = "panic" ]
            then
                journalctl -k | grep -i "panic"

            elif [ "$fault2" = "segfault" ]
            then
                journalctl -k | grep -iE "segfault|segmentation fault"

            else
                echo "there is no fault $fault2"
            fi
        fi
    fi

    if ! run_again
    then
        break
    fi

done