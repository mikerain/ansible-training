#!/bin/bash

get_ulimit_stacksize_hard() {
	ulimit_stacksize_hard=$(ulimit -Hs)
	echo $ulimit_stacksize_hard
}

get_ulimit_stacksize_hard
