# 176156_Veer_Shell_Scripting_4_T002
# Author: Veer Bhalodia
# Description: This shell script performs the given string is palindrome or not.

#!/bin/bash

source ./common.sh

while true
do

    echo "Enter a string:"
    read str

    if check_blank "$str"
    then
        echo "This String is empty."

    else
        string=${str// /}
        Str=${string,,}

        rev=""

        len=${#Str}

        for ((i=len-1; i>=0; i--))
        do
            rev="$rev${Str:$i:1}"
        done

        if [ "$Str" = "$rev" ]
        then
            echo "The string '$str' is a palindrome."
        else
            echo "The string '$str' is not a palindrome."
        fi
    fi

    if ! run_again
    then
        break
    fi

done