#!/bin/bash

get_kdump_active() {
	kdump_active=$(systemctl is-active kdump.service)
	if [[ "${kdump_active}" == "unknown" ]]
	then
		kdump_active="inactive"
	fi

	echo $kdump_active
}

get_kdump_active
