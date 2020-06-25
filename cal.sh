#!/bin/bash

PerfPATH=/users/weicuidi/performance_test/wrk1.txt
TMPPATH=/users/weicuidi/tmp.txt
RESULT=/users/weicuidi/result1.txt

echo "Threads  Concurrency  File  50th_latency  99th_latency  Throughput" > $RESULT 

function get_tc()
{
	echo "get_tc"
	echo $@
}

function readfile()
{
	while read line
		case $line in
			Running*): echo >> $RESULT;;
			*threads*connections*): t_c;;

		esac

	do
	done < $PerfPATH
}

readfile
