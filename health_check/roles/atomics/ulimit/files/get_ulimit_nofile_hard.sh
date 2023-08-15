#!/bin/bash

get_ulimit_nofile_hard() {
	ulimit_nofile_hard=$(ulimit -Hn)
	echo $ulimit_nofile_hard
}

get_ulimit_nofile_hard
