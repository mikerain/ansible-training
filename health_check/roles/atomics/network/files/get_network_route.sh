#!/bin/bash

get_network_route() {
	network_route=$(ip r |grep default)
	echo $network_route
}

get_network_route
