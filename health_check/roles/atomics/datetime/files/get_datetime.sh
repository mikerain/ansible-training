#!/bin/bash

get_datetime() {
	datetime=$(timedatectl |grep "Local time"| awk '{print $3,$4,$5}')
	echo $datetime
}
get_datetime
