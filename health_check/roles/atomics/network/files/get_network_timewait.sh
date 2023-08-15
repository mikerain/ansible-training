#!/bin/bash

get_network_timewait() {
	network_timewait=$(netstat -an |grep TIME_WAIT |wc -l)
	echo $network_timewait
}

get_network_timewait
