#!/bin/bash
#./cal.sh result/wrk1.txt 1k

PerfPATH=/users/weicuidi/performance_test/result/wrk1.txt.bak
TMPPATH=/users/weicuidi/performance_test/tmp.txt
RESULT=/users/weicuidi/performance_test/result1.txt

echo "Threads,Concurrency,File,50th_latency,99th_latency,Throughput" > $RESULT 

function get_tc()
{
	echo -n "$1,$4," >> $RESULT
}
function write_file()
{
	echo -n "$1," >> $RESULT
}
function write_latency()
{
	echo -n "$2," >> $RESULT
}
function write_throughput()
{
	echo -n $2 >> $RESULT
}

function readfile()
{
	echo "filename:$1 filesize:$2"
	while read line
	do
		if [[ $line == Running* ]]
		then
			echo "">>$RESULT
		elif [[ $line == *threads* ]] && [[ $line == *connections* ]]
		then
			get_tc $line
			write_file $2
		elif [[ $line == 50%* ]]
		then
			write_latency $line
		elif [[ $line == 99%* ]]
		then
			write_latency $line
		elif [[ $line == Requests/sec* ]]
		then
			write_throughput $line
		fi

	done < $PerfPATH
}

#readfile $1 $2
readfile $PerfPATH 1
