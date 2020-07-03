#!/bin/bash
timestamp=$(date +%s)
echo $timestamp
FILEPATH=./result/$1-11k-$timestamp.txt
>$FILEPATH

URL1=http://192.168.1.4/index.html
URL2=http://192.168.1.4/index1.html
URL3=http://192.168.1.4/index111.html
#Requests
for i in 500 5000 10000 20000 30000
do      
        echo "Welcome $i times"
	#threads
	for j in 20
	do
		#connections
		for k in  100
		do
			echo "wrk -t ${j} -c ${k} -d30s -R ${i} -file_k 11 --latency $URL1"
			echo "wrk -t ${j} -c ${k} -d30s -R ${i} -file_k 11 --latency $URL1" >> $FILEPATH
			wrk -t${j} -c${k} -d30s -R${i} --latency $URL1 >> $FILEPATH
		done
		sleep 10
	done

	for j in 4 10 20
        do
                for k in  20 100 500 1000
                do
                        echo "wrk -t ${j} -c ${k} -d30s -R ${i} -file_k 1 --latency $URL2" >> $FILEPATH
                        wrk -t${j} -c${k} -d30s -R${i} --latency $URL2 >> $FILEPATH
                done
                sleep 10
        done

	for j in 4 10 20
        do
                for k in  20 100 500 1000
                do
                        echo "wrk -t ${j} -c ${k} -d30s -R ${i} -file_k 111 --latency $URL3" >> $FILEPATH
                        wrk -t${j} -c${k} -d30s -R${i} --latency $URL3 >> $FILEPATH
                done
                sleep 10
        done
done
