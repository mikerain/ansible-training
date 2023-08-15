#!/bin/bash

TARGET=/tmp/hosts2
echo "#begin" >$TARGET
date >>$TARGET
cat /etc/hosts >>$TARGET
echo "#end" >> $TARGET

exit 1
