#!/bin/bash

# 176156_Veer_Shell_Scripting_7_T002
# Author: Veer Bhalodia
# Description: Creates a new system user and sets a default password.

source ./common.sh

while true
do

    password="password123"

    if [ "$EUID" -ne 0 ]
    then
        echo "Run script in root mode."

    else
        echo "Enter the username:"
        read username

        while [[ "$username" == " "* ]]
        do
            username="${username# }"
        done

        if check_blank "$username"
        then
            echo "Username cannot be empty."

        elif [[ "$username" == *" "* ]]
        then
            echo "Username can't contain spaces."

        elif id "$username" > /dev/null 2>&1
        then
            echo "User already exists."

        else
            useradd "$username"
            echo "$username:$password" | chpasswd
            echo "User '$username' has been added successfully with default password '$password'."
        fi
    fi

    if ! run_again
    then
        break
    fi

done