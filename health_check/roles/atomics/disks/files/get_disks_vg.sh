#!/bin/bash

get_disks_vg() {
	for i in ${vgs[@]}; do
		vgdisplay $i |tail -n +2 |grep -iE "VG Name|VG Status |VG Size|PE"
		echo
        done
	
}
vgs=`vgs |tail -n +2 |awk '{print $1}'`
get_disks_vg
