#!/bin/bash

get_mem_used() {
	used=$(free -mh | grep "Mem" |awk '{print $3}')
	echo $used
}
get_mem_used
