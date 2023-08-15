#!/bin/bash

get_disks_mount() {
	for i in ${partitions[@]}; do
		echo "mount point: $i"
		mount_info_df=$(df -h $i |grep "${i}$"| sed 's/[\t ]\+/ /g')
		echo "mount info in df: $mount_info_df"
		cat /etc/fstab |grep -v "#" |grep -v "^$"| sed 's/[\t ]\+/ /g' |while read LINE
		do
			ret=$(echo $LINE|cut -d" " -f2)
			if [[ $ret == ${i} ]]; then
				echo "mount info in fstab: $LINE"
			fi
		
		done

        done
	
}
partitions=`df -hP |tail -n +2 | grep -v tmpfs |awk '{print $6}'`
get_disks_mount
