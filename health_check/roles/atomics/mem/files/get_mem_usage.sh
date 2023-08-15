#!/bin/bash

get_mem_usage() {
	total=$(free -m | grep "Mem" |awk '{print $2}')
	used=$(free -m | grep "Mem" |awk '{print $3}')
	usage=$(awk 'BEGIN {print '$used'/'$total'*100}')
	echo $usage
}
get_mem_usage
