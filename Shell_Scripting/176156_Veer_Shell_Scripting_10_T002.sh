# 176156_Veer_Shell_Scripting_10_T002
# Author: Veer Bhalodia
# Description: Generates a random password of the specified length using alphanumeric and special characters.

#!/bin/bash

source ./common.sh

while true
do

    echo "Enter the password length:"
    read length

    if check_blank "$length"
    then
        echo "length cannot be empty."

    elif ! [[ "$length" =~ ^[0-9-]+$ ]]
    then
        echo "invalid input"

    elif [ "$length" -le 0 ]
    then
        echo "length must be greater than 0."

    else
        password=""
        characters=({A..Z} {a..z} {0..9} \! \@ \# \$ \% \^ \& \*)

        for ((i=0; i<length; i++))
        do
            random=$((RANDOM % 70))
            password="$password${characters[$random]}"
        done

        echo "Generated password: $password"
    fi

    if ! run_again
    then
        break
    fi

done