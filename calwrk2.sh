#!/bin/bash 
#./cal.sh inputfile file_k outputfile
#./cal.sh result/wrk1.txt 1  

WrkPATH=/users/weicuidi/performance_test/result
RESULT=/users/weicuidi/performance_test/pubsub-test.csv

echo "Threads,Concurrency,Request,File_k,50th_latency,99th_latency,Throughput" > $RESULT 

function write_latency()
{
	echo -n "$2," >> $RESULT
}
function write_throughput()
{
	echo $2 >> $RESULT
}
function getwrk()
{
	echo -n "$3,$5,$8,${10}," >> $RESULT
	echo "$3,$5,$8,${10},"
}

function readfile()
{
	while read line
	do
		if [[ $line == wrk* ]]
		then
			getwrk $line
			echo $line
		elif [[ $line == 50.000%* ]]
		then
			echo $line
			write_latency $line
		elif [[ $line == 99.000%* ]]
		then
			echo $line
			write_latency $line
		elif [[ $line == Requests/sec* ]]
		then
			echo $line
			write_throughput $line
		fi

	done < $1
}

#readfile $1 $2
#readfile $1 $WrkPATH/$1 
echo $RESULT
readfile $WrkPATH/pubsub-test.txt 
#readfile $WrkPATH/bridge-11k-1593455789.txt 11 
#readfile $WrkPATH/bridge-111k-1593455789.txt 111 
