#!/bin/bash

get_firewalld_active() {
	firewalld_active=$(systemctl is-active firewalld.service)
	if [[ "${firewalld_active}" == "unknown" ]]
	then
		firewalld_active="inactive"
	fi
	echo $firewalld_active
}
get_firewalld_active
