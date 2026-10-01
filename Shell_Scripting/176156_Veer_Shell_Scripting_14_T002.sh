# 176156_Veer_Shell_Scripting_14_T002
# Author: Veer Bhalodia
# Description: Counts word occurrences in a text file and displays them sorted by frequency.

#!/bin/bash

source ./common.sh

while true
do

    echo "Enter the text file path:"
    read file

    if check_blank "$file"
    then
        echo "file path cannot be empty"

    elif [[ "$file" != *.txt ]]
    then
        echo "only .txt files are allowed"

    else
        file=$(convert_path "$file")

        if check_file "$file"
        then
            echo "the file $file does not exist"

        elif [ ! -r "$file" ]
        then
            echo "cant read this file"

        elif [ ! -s "$file" ]
        then
            echo "the file $file is empty"

        else
            echo "Word frequency analysis:"

            str=$(cat "$file")
            str=${str,,}

            echo "$str" |
            tr -cs '[:alnum:]' '\n' |
            sort |
            uniq -c |
            sort -nr |
            awk '{print $2 " - " $1 " occurrences"}'
        fi
    fi

    if ! run_again
    then
        break
    fi

done