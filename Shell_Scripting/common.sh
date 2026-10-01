#!/bin/bash

check_blank()
{
    [ -z "$1" ]
}

# check_string_in_number()
# {
#     [[ ! "$1" =~ ^-?[0-9]+([.][0-9]+)?$ ]]
# }

check_number()
{
    [[ "$1" =~ ^-?[0-9]+([.][0-9]+)?$ ]]
}

convert_path()
{
    echo "${1/#\~/$HOME}"
}

check_directory()
{
    [ ! -d "$1" ]
}

check_file()
{
    [ ! -f "$1" ]
}

run_again()
{
    while true
    do
        echo "Do you want to run the program again? (Y/N)"
        read choice

        if [ "$choice" = "Y" ] || [ "$choice" = "y" ]
        then
            return 0

        elif [ "$choice" = "N" ] || [ "$choice" = "n" ]
        then
            echo "Exiting..."
            return 1

        else
            echo "Invalid choice. Please enter Y or N."
        fi
    done
}