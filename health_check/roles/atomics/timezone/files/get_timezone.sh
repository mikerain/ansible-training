#!/bin/bash

get_timezone() {
	timezone=$(timedatectl |grep "Time zone"| awk '{print $3,$4,$5}')
	echo $timezone
}
get_timezone
