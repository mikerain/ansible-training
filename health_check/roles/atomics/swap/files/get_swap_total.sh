#!/bin/bash

get_swap_total() {
	total=$(free -mh | grep "Swap" |awk '{print $2}')
	echo $total
}
get_swap_total
