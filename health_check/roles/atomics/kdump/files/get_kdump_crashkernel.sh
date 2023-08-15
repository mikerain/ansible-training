#!/bin/bash

get_kdump_crashkernel() {
	kdump_crashkernel=$(cat /proc/cmdline |grep crashkernel| tr " " "\n" | grep crashkernel)
	if [[ "$kdump_crashkernel" == "" ]]
	then
	    echo "NOT setting"
	else
            echo $kdump_crashkernel
	fi
}

get_kdump_crashkernel
