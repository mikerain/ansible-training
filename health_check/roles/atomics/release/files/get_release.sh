#!/bin/bash

get_release() {
	release=$(cat /etc/redhat-release)
	echo $release
}
get_release
