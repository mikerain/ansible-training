#!/bin/bash

get_ulimit_core_soft() {
	ulimit_core_soft=$(ulimit -c)
	echo $ulimit_core_soft
}

get_ulimit_core_soft
