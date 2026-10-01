# 176156_Veer_Shell_Scripting_2_T002
# Author: Veer Bhalodia
# Description: This shell script checks whether a given number is even or odd.

#!/bin/bash

source ./common.sh

while true
do

    echo "Enter a number:"
    read n

    if check_blank "$n"
    then
        echo "Not a valid number, Blank is not allowed."

    elif ! check_number "$n"
    then
        echo "Not a valid number"

    elif [[ $n == *.* ]]
    then
        if [[ $n == *.0 ]]
        then
            n=${n%.*}

            if [ $((n % 2)) -eq 0 ]
            then
                echo "$n is Even number"
            else
                echo "$n is Odd number"
            fi

        else
            echo "Float is not valid"
        fi

    else
        if [ $((n % 2)) -eq 0 ]
        then
            echo "$n is Even number"
        else
            echo "$n is Odd number"
        fi
    fi

    if ! run_again
    then
        break
    fi

done