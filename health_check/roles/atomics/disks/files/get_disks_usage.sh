#!/bin/bash

get_disks_usage() {
	for i in ${partitions[@]}; do
		disk_usage=$(df -h $i |grep "${i}$"|awk '{print $(NF-1)}'| sed -e 's/%//g')
		echo "$i: ${disk_usage}%" 
        done
	
}
partitions=`df -hP |tail -n +2 | grep -v tmpfs |awk '{print $6}'`
get_disks_usage
