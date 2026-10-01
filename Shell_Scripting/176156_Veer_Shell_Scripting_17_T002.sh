# 176156_Veer_Shell_Scripting_17_T002
# Author: Veer Bhalodia
# Description: Generates a log file containing the output of a C program.

#!/bin/bash

source ./common.sh

while true
do

    echo "Enter the C file path:"
    read file

    if [ -z "$file" ]
    then
        echo "Input cannot be empty."

    elif [[ "$file" != *.c ]]
    then
        echo "Only .c files are allowed."

    elif [ ! -f "$file" ]
    then
        echo "$file does not exist."

    elif [ ! -s "$file" ]
    then
        echo "$file is empty."

    else
        gcc "$file" -o program

        if [ $? -eq 0 ]
        then
            ./program > output.log
            echo "Program output stored in output.log"
        else
            echo "Compilation failed."
        fi
    fi

    if ! run_again
    then
        break
    fi

done