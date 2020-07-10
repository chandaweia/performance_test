#!/bin/bash
timestamp=$(date +%s)
echo $timestamp
FILEPATH=./n2nresult/$1-11k-$timestamp.txt
>$FILEPATH
echo $FILEPATH

URL1=http://192.168.1.4:8089
#URL2=http://192.168.1.4/index1.html
#URL3=http://192.168.1.4/index111.html
#Requests
for i in 5000 10000 20000 30000 40000 50000 600000
do      
        echo "Welcome $i times"
	echo "wrk -t 20 -c 100 -d30s -R ${i} -file_k 11 --latency $URL1"
	echo "wrk -t 20 -c 100 -d30s -R ${i} -file_k 11 --latency $URL1" >> $FILEPATH
	wrk -t20 -c100 -d30s -R${i} --latency $URL1 >> $FILEPATH
	sleep 10
	echo "wrk -t 20 -c 100 -d30s -R ${i} -file_k 11 --latency $URL1" >> $FILEPATH
	wrk -t20 -c100 -d30s -R${i} --latency $URL1 >> $FILEPATH
        sleep 10
	#wrk -t20 -c100 -d30s -R${i} --latency $URL2 >> $FILEPATH
        #sleep 10
	#wrk -t20 -c100 -d30s -R${i} --latency $URL3 >> $FILEPATH
        #sleep 10
done
