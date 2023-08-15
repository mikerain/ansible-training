#!/bin/bash

get_cpu_idle() {
	cpu_idle=$(top -n 1 |grep Cpu |awk '{print $8}')
	echo $cpu_idle
}
get_cpu_idle
