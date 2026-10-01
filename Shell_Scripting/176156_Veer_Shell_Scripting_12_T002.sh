# 176156_Veer_Shell_Scripting_12_T002
# Author: Veer Bhalodia
# Description: Generates and saves a disk usage report for all mounted file systems.


source ./common.sh

while true
do

    echo "Enter the output file to save the disk usage report:"
    read output_file

    if [ -z "$output_file" ]
    then
        echo "output path can not be empty"

    elif [[ "$output_file" != *.txt ]]
    then
        echo "not valid file path. enter .txt file"

    else
        output_file="${output_file/#\~/$HOME}"
        directory=$(dirname "$output_file")

        if [ ! -d "$directory" ]
        then
            echo "invalid file path"
        else
            df -h > "$output_file"
            echo "Disk usage report generated and saved to ${output_file/#$HOME/\~}."
        fi
    fi

    if ! run_again
    then
        break
    fi

done