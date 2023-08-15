#!/bin/bash

get_mem_total() {
	total=$(free -mh | grep "Mem" |awk '{print $2}')
	echo $total
}
get_mem_total
