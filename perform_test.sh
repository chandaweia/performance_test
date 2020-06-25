#!/bin/bash
FILEPATH=/users/weicuidi/performance_test/result/wrk1.txt
wrk -t4 -c20 -d60s -T30s --latency http://192.168.1.4 > $FILEPATH
sleep 10
wrk -t4 -c100 -d60s -T30s --latency http://192.168.1.4 >> $FILEPATH
