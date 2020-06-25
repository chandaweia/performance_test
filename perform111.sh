#!/bin/bash

FILEPATH=./result/wrk1.txt
wrk -t4 -c20 -d60s -T30s --latency http://192.168.1.4/index111.html > $FILEPATH
sleep 10
wrk -t4 -c100 -d60s -T30s --latency http://192.168.1.4/index111.html >> $FILEPATH
sleep 10
wrk -t4 -c500 -d60s -T30s --latency http://192.168.1.4/index111.html >> $FILEPATH
sleep 10
wrk -t4 -c1000 -d60s -T30s --latency http://192.168.1.4/index111.html >> $FILEPATH
sleep 10

wrk -t10 -c20 -d60s -T30s --latency http://192.168.1.4/index111.html >> $FILEPATH
sleep 10
wrk -t10 -c100 -d60s -T30s --latency http://192.168.1.4/index111.html >> $FILEPATH
sleep 10
wrk -t10 -c500 -d60s -T30s --latency http://192.168.1.4/index111.html >> $FILEPATH
sleep 10
wrk -t10 -c1000 -d60s -T30s --latency http://192.168.1.4/index111.html >> $FILEPATH
sleep 10

wrk -t20 -c20 -d60s -T30s --latency http://192.168.1.4/index111.html >> $FILEPATH
sleep 10
wrk -t20 -c100 -d60s -T30s --latency http://192.168.1.4/index111.html >> $FILEPATH
sleep 10
wrk -t20 -c500 -d60s -T30s --latency http://192.168.1.4/index111.html >> $FILEPATH
sleep 10
wrk -t20 -c1000 -d60s -T30s --latency http://192.168.1.4/index111.html >> $FILEPATH
sleep 10
