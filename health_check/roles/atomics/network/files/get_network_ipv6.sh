#!/bin/bash

get_network_ipv6() {
	network_ipv4=$(ip a |grep -w inet6 |grep -v ::1/128|awk '{print $2" "$NF}';echo)
	echo $network_ipv6 ";"
}

get_network_ipv6
