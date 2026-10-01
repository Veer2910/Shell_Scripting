#!/bin/bash

# 176156_Veer_Shell_Scripting_11_T002
# Author: Veer Bhalodia
# Description: Monitors CPU and memory usage, logs the data, and alerts when usage exceeds the given thresholds.

source ./common.sh

echo "Enter the CPU usage threshold:"
read c_thres

echo "Enter the memory usage threshold:"
read m_thres

if check_blank "$c_thres"
then
    echo "CPU threshold cannot be empty."

elif check_blank "$m_thres"
then
    echo "Memory threshold cannot be empty."

elif [[ "$c_thres" == -* ]]
then
    echo "CPU threshold cannot be negative."

elif [[ "$m_thres" == -* ]]
then
    echo "Memory threshold cannot be negative."

elif ! [[ "$c_thres" =~ ^[0-9]+([.][0-9]+)?$ ]]
then
    echo "CPU threshold must be a number."

elif ! [[ "$m_thres" =~ ^[0-9]+([.][0-9]+)?$ ]]
then
    echo "Memory threshold must be a number."

elif ! awk "BEGIN { exit !($c_thres <= 100 && $m_thres <= 100) }"
then
    echo "Threshold cannot be above 100%."

else
    cpu_usage=$(top -bn1 | awk '/Cpu\(s\)/ {print 100 - $8}')
    memory_usage=$(free | awk '/Mem:/ {print ($3/$2)*100}')

    cpu_usage=${cpu_usage%.*}
    memory_usage=${memory_usage%.*}

    c_thres_int=${c_thres%.*}
    m_thres_int=${m_thres%.*}

    if [ "$cpu_usage" -gt "$c_thres_int" ]
    then
        echo "CPU usage is $cpu_usage%. Exceeds threshold of $c_thres%."
    fi

    if [ "$memory_usage" -gt "$m_thres_int" ]
    then
        echo "Memory usage is $memory_usage%. Exceeds threshold of $m_thres%."
    fi

    echo "Current CPU usage: $cpu_usage%"
    echo "Current Memory usage: $memory_usage%"

    echo "CPU usage is $cpu_usage%" >> system_usage.log
    echo "Memory usage is $memory_usage%" >> system_usage.log
fi