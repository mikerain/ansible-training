#!/bin/bash

get_swap_usage() {
	total=$(free -m | grep "Swap" |awk '{print $2}')
	used=$(free -m | grep "Swap" |awk '{print $3}')
	usage=$(awk 'BEGIN {print '$used'/'$total'*100}')
	echo $usage
}
get_swap_usage
