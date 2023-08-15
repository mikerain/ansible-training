#!/bin/bash

get_language() {
	language=$(locale |grep LANG|awk -F = '{print $2}')
	echo $language
}

get_language
