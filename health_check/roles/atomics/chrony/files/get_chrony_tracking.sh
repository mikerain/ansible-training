#!/bin/bash

get_chrony_tracking() {
	chrony_tracking=$(chronyc tracking |grep System|awk -F . '{print $1}'|awk -F : '{print $2}')
	echo $chrony_tracking
}

get_chrony_tracking
