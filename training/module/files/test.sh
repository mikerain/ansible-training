#!/bin/bash

TARGET=/tmp/hosts
echo "#begin" >$TARGET
date >>$TARGET
cat /etc/hosts >>$TARGET
echo "#end" >> $TARGET
