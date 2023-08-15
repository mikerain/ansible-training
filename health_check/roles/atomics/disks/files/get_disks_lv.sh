#!/bin/bash

get_disks_lv() {
	for i in ${lvs[@]}; do
		lvdisplay $i | tail -n +2 |grep -E "LV Path | LV Status|LV Size"
		echo
        done
	
}
lvs=`lvs |tail -n +2 |awk '{print "/dev/"$2"/"$1}'`
get_disks_lv
