# 176156_Veer_Shell_Scripting_15_T002
# Author: Veer Bhalodia
# Description: Creates a main directory, task-wise subfolders, and files with the specified extensions.


#!/bin/bash

source ./common.sh

while true
do

    echo "Enter Linux username:"
    read username

    echo "Enter GID:"
    read gid

    echo "Enter Firstname:"
    read firstname

    echo "Enter TaskName:"
    read taskname

    echo "Enter Task ID:"
    read taskid

    if check_blank "$username" || check_blank "$gid" || check_blank "$firstname" || check_blank "$taskid"
    then
        echo "All inputs are required."

    elif [ "$gid" = "0" ] || [[ "$gid" =~ ^[0-9]{6}$ ]]
    then

        if [[ "$taskname" == *" "* ]]
        then
            echo "Spaces are not allowed in taskname use _"

        else
            main_dir="${gid}_${firstname}"
            task_dir="$main_dir/$taskname"

            if [ -d "$main_dir" ]
            then
                echo "Directory already exists."
            else
                mkdir "$main_dir"
            fi

            if [ -d "$task_dir" ]
            then
                echo "Subfolder already exists."
            else
                mkdir "$task_dir"
            fi

            touch "$task_dir/${gid}_${firstname}_${taskname}_Module1_${taskid}.c"
            touch "$task_dir/${gid}_${firstname}_${taskname}_Module1_${taskid}.h"
            touch "$task_dir/${gid}_${firstname}_${taskname}_Module1_${taskid}.sh"
            touch "$task_dir/${gid}_${firstname}_${taskname}_Module1_${taskid}.xls"
            touch "$task_dir/${gid}_${firstname}_${taskname}_Module1_${taskid}.ko"
            touch "$task_dir/${gid}_${firstname}_${taskname}_Module1_${taskid}.a"
            touch "$task_dir/${gid}_${firstname}_${taskname}_Module1_${taskid}.so"

            echo "Files created successfully."
        fi

    else
        echo "Enter valid GID"
    fi

    if ! run_again
    then
        break
    fi

done