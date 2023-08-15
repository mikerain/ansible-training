#!/bin/bash

get_ulimit_nofile_soft() {
	ulimit_nofile_soft=$(ulimit -n)
	echo $ulimit_nofile_soft
}

get_ulimit_nofile_soft
