#!/bin/bash
timestamp=$(date +%s)
echo $timestamp
FILEPATH=./n2nresult/$1-11k-$timestamp.txt
REPORT=./report/$1-11k-$timestamp.csv
>$FILEPATH
echo $FILEPATH

function wrk_test()
{
	URL1=http://192.168.1.4:8089
	#Requests
	for i in 5000 10000 20000 30000 40000 50000 60000 70000
	do      
        	echo "Welcome $i times"
		echo "wrk -t 20 -c 100 -d30s -R ${i} -file_k 11 --latency $URL1"

		#echo "wrk -t 20 -c 100 -d30s -R ${i} -file_k 11 --latency $URL1" >> $FILEPATH
		#wrk -t20 -c100 -d30s -R${i} --latency $URL1 >> $FILEPATH
		wrk -t20 -c100 -d30s -R${i} --latency $URL1 >> tmp
		sleep 10

		echo "wrk -t 20 -c 100 -d30s -R ${i} -file_k 11 --latency $URL1" >> $FILEPATH
		wrk -t20 -c100 -d30s -R${i} --latency $URL1 >> $FILEPATH
        	sleep 10

		#wrk -t20 -c100 -d30s -R${i} --latency $URL2 >> $FILEPATH
        	#sleep 10
		#wrk -t20 -c100 -d30s -R${i} --latency $URL3 >> $FILEPATH
        	#sleep 10
	done
}

function report()
{
	echo "report:$REPORT"
	./calwrk2.sh $FILEPATH $REPORT
}

#wrk_test
report
