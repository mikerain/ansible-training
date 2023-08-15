#!/bin/bash

get_chrony_enable() {
	chrony_enable=$(systemctl is-enabled chronyd.service)
	echo $chrony_enable
}

get_chrony_enable
