# 176156_Veer_Shell_Scripting_18_T002
# Author: Veer Bhalodia
# Description: Checks a given C source file to verify whether it follows the required coding standards.


#!/bin/bash

source ./common.sh

while true
do

    echo "Enter the C file path:"
    read file

    if [ -z "$file" ]
    then
        echo "C file input cannot be empty."

    elif [[ "$file" != *.c ]]
    then
        echo "only .c files are allowed."

    elif [ ! -f "$file" ]
    then
        echo "$file does not exist."

    elif [ ! -s "$file" ]
    then
        echo "$file file is empty."

    elif grep -q "//" "$file"
    then
        echo "// Only multi-line comments are allowed."

    elif ! grep -q "/\*" "$file"
    then
        echo "does not follow coding standards."

    elif ! grep -q "#include" "$file"
    then
        echo "does not follow coding standards."

    elif ! grep -q "main" "$file"
    then
        echo "C file is not valid."

    else
        echo "This $file file follows coding standards."
    fi

    if ! run_again
    then
        break
    fi

done