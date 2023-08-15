#!/bin/bash

get_network_ipv4() {
	network_ipv4=$(ip a |grep -w inet |grep -v 127.0.0.1 |awk '{print $2" "$NF}'; echo)
	echo $network_ipv4 ";"
}

get_network_ipv4
