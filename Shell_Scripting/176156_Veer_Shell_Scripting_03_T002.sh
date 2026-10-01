# 176156_Veer_Shell_Scripting_3_T002
# Author: Veer Bhalodia
# Description: # Find the greatest element from given input.


#!/bin/bash

source ./common.sh

while true
do

    echo "Enter first number:"
    read a

    echo "Enter second number:"
    read b

    echo "Enter third number:"
    read c

    if [ -z "$a" ] || [ -z "$b" ] || [ -z "$c" ]
    then
        echo "Invalid input"

    elif [[ $a == *[a-zA-Z]* ]]
    then
        echo "Number 1 is NaN"

    elif [[ $b == *[a-zA-Z]* ]]
    then
        echo "Number 2 is NaN"

    elif [[ $c == *[a-zA-Z]* ]]
    then
        echo "Number 3 is NaN"

    elif [ $a -ge $b ] && [ $a -ge $c ]
    then
        echo "The largest number is $a"

    elif [ $b -ge $a ] && [ $b -ge $c ]
    then
        echo "The largest number is $b"

    else
        echo "The largest number is $c"
    fi

    if ! run_again
    then
        break
    fi

done