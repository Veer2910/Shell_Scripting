#!/bin/bash

source ./common.sh

while true
do
    echo "Enter the 1st Number:"
    read a

    echo "Enter the 2nd Number:"
    read b

    if check_blank "$a"
    then
        echo "Invalid input"

    elif check_blank "$b"
    then
        echo "Invalid input"

    elif ! check_number "$a"
    then
        echo "Num1 is NaN"

    elif ! check_number "$b"
    then
        echo "Num2 is NaN"

    else
        echo "Addition = $(echo "$a+$b" | bc)"
        echo "Subtraction = $(echo "$a-$b" | bc)"
        echo "Multiplication = $(echo "$a*$b" | bc)"

        if [ "$a" = "0" ] && [ "$b" = "0" ]
        then
            echo "Div: Undefined (0/0)"

        elif [ "$b" != "0" ]
        then
            echo "Division = $(echo "scale=2; $a/$b" | bc)"

        else
            echo "It cannot divide by zero."
        fi
    fi

    if ! run_again
    then
        break
    fi
done