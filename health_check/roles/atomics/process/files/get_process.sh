#!/bin/bash

get_process() {
	#process=$(top -n 1 |grep "Task" | awk '{print $2,$3,$4,$5}' |sed 's/^[ \t]*//g')
	total=$(top -n 1 |grep "Task" | awk '{print $2}' )
	running=$(top -n 1 |grep "Task" | awk '{print $4}' )
	echo "total processes: " $total ";"
	echo "running processes: " $running ";"
}

get_process
