#!/bin/bash

get_umask() {
	umask=$(umask)
	echo $umask
}

get_umask
