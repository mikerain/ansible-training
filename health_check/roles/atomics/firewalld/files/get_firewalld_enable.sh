#!/bin/bash

get_firewalld_enable() {
	firewalld_enable=$(systemctl is-enabled firewalld.service)
	echo $firewalld_enable
}
get_firewalld_enable
