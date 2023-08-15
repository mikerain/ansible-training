#!/bin/bash

get_process_mem_top10() {
	ps -eo pid,uname,pmem,comm|head -1; ps -eo pid,uname,pmem,comm |grep -v PID|sort -rn -k +4 |head
}

get_process_mem_top10
