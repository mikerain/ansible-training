#!/bin/bash

get_kdump_enable() {
	kdump_enable=$(systemctl is-enabled kdump.service)
	echo $kdump_enable
}

get_kdump_enable
