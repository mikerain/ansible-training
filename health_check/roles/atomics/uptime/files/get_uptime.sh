#!/bin/bash

get_uptime() {
	uptime=$(uptime | awk -F ',' '{print $1}' |sed 's/^[ \t]*//g')
	echo $uptime
}

get_uptime
