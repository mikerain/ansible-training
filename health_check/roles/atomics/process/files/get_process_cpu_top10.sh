#!/bin/bash

get_process_cpu_top10() {
        ps -eo pid,uname,pcpu,comm|head -1; ps -eo pid,uname,pcpu,comm |grep -v PID|sort -rn -k +4 |head
}

get_process_cpu_top10
