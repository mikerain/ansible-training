#!/bin/bash

get_selinux() {
	selinux=$(getenforce)
	echo $selinux
}
get_selinux
