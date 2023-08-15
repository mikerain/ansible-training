#!/bin/bash

get_chrony_source() {
	chrony_source=$(chronyc sources |grep "^\^\*"|awk '{print $1,$2}')
	echo $chrony_source
}

get_chrony_source
