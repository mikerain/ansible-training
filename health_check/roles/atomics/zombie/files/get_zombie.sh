#!/bin/bash

get_zombie() {
	zombie=$(top -n 1 |grep "Task" | awk '{print $10}')
	echo $zombie
}

get_zombie
