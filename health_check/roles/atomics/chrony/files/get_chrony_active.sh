#!/bin/bash

get_chrony_active() {
	chrony_active=$(systemctl is-active chronyd.service1)
	if [[ "${chrony_active}" == "unknown" ]]
	then
		chrony_active="inactive"
	fi

	echo $chrony_active
}

get_chrony_active
