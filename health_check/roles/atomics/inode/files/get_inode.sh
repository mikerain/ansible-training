#!/bin/bash

get_inode() {
	for i in ${partitions[@]}; do
		inode_usage=$(df -i $i |grep "${i}$"|awk '{print $(NF-1)}'| sed -e 's/%//g')
		if [ $inode_usage == "-" ]
	        then
			continue
		fi
		echo "$i: ${inode_usage}%"
		#echo $i
        done
	
}
partitions=`df -i |tail -n +2 | grep -v tmpfs |awk '{print $6}'`
get_inode
