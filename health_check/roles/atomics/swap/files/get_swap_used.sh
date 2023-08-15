#!/bin/bash

get_swap_used() {
	used=$(free -mh | grep "Swap" |awk '{print $3}')
	echo $used
}
get_swap_used
