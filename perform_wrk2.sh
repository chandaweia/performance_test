#!/bin/bash
timestamp=$(date +%s)
echo $timestamp
FILEPATH=./result/$1-11k-$timestamp.txt
for i in {500..20000..500}
do
	echo "Welcome $i times"
done
wrk -t4 -c20 -d60s -R500 --latency http://192.168.1.4/index.html > $FILEPATH
sleep 10
wrk -t4 -c100 -d60s -R1000 --latency http://192.168.1.4/index.html >> $FILEPATH
sleep 10
wrk -t4 -c500 -d60s -R1500 --latency http://192.168.1.4/index.html >> $FILEPATH
sleep 10
wrk -t4 -c1000 -d60s -T30s --latency http://192.168.1.4/index.html >> $FILEPATH
sleep 10
wrk -t10 -c20 -d60s -T30s --latency http://192.168.1.4/index.html >> $FILEPATH
sleep 10
wrk -t10 -c100 -d60s -T30s --latency http://192.168.1.4/index.html >> $FILEPATH
sleep 10
wrk -t10 -c500 -d60s -T30s --latency http://192.168.1.4/index.html >> $FILEPATH
sleep 10
wrk -t10 -c1000 -d60s -T30s --latency http://192.168.1.4/index.html >> $FILEPATH
sleep 10
wrk -t20 -c20 -d60s -T30s --latency http://192.168.1.4/index.html >> $FILEPATH
sleep 10
wrk -t20 -c100 -d60s -T30s --latency http://192.168.1.4/index.html >> $FILEPATH
sleep 10
wrk -t20 -c500 -d60s -T30s --latency http://192.168.1.4/index.html >> $FILEPATH
sleep 10
wrk -t20 -c1000 -d60s -T30s --latency http://192.168.1.4/index.html >> $FILEPATH
sleep 10

FILEPATH=./result/$1-1k-$timestamp.txt
wrk -t4 -c20 -d60s -T30s --latency http://192.168.1.4/index1.html > $FILEPATH
sleep 10
wrk -t4 -c100 -d60s -T30s --latency http://192.168.1.4/index1.html >> $FILEPATH
sleep 10
wrk -t4 -c500 -d60s -T30s --latency http://192.168.1.4/index1.html >> $FILEPATH
sleep 10
wrk -t4 -c1000 -d60s -T30s --latency http://192.168.1.4/index1.html >> $FILEPATH
sleep 10
wrk -t10 -c20 -d60s -T30s --latency http://192.168.1.4/index1.html >> $FILEPATH
sleep 10
wrk -t10 -c100 -d60s -T30s --latency http://192.168.1.4/index1.html >> $FILEPATH
sleep 10
wrk -t10 -c500 -d60s -T30s --latency http://192.168.1.4/index1.html >> $FILEPATH
sleep 10
wrk -t10 -c1000 -d60s -T30s --latency http://192.168.1.4/index1.html >> $FILEPATH
sleep 10
wrk -t20 -c20 -d60s -T30s --latency http://192.168.1.4/index1.html >> $FILEPATH
sleep 10
wrk -t20 -c100 -d60s -T30s --latency http://192.168.1.4/index1.html >> $FILEPATH
sleep 10
wrk -t20 -c500 -d60s -T30s --latency http://192.168.1.4/index1.html >> $FILEPATH
sleep 10
wrk -t20 -c1000 -d60s -T30s --latency http://192.168.1.4/index1.html >> $FILEPATH
sleep 10

FILEPATH=./result/$1-111k-$timestamp.txt
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
