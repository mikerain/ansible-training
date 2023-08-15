#!/bin/bash

get_disks_pv() {
	for i in ${pvs[@]}; do
		pvdisplay $i | tail -n +2 | grep  -iE "PV Name| VG Name | PV Size |PE"
	        echo
        done
	
}
pvs=`pvs |tail -n +2|awk '{print $1}'`
get_disks_pv
