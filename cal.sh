#!/bin/bash 
#./cal.sh inputfile file_k outputfile
#./cal.sh result/wrk1.txt 1  

WrkPATH=/users/weicuidi/performance_test/result
RESULT=/users/weicuidi/performance_test/pub_sub_mos-1593292004.txt

echo "Threads,Concurrency,File_k,50th_latency,99th_latency,Throughput" > $RESULT 

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

	done < $1
}

#readfile $1 $2
#readfile $1 $WrkPATH/$1 
echo $RESULT
readfile $WrkPATH/wrk1-1593292004.txt 1 
readfile $WrkPATH/wrk11-1593292004.txt 11 
readfile $WrkPATH/wrk111-1593292004.txt 111 
