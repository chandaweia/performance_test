#!/bin/bash
timestamp=$(date +%s)
echo $timestamp
FILEPATH=./result/$1-11k-$timestamp.txt
>$FILEPATH

URL1=http://192.168.1.4/index.html
URL2=http://192.168.1.4/index1.html
URL3=http://192.168.1.4/index111.html
for i in 500 1000 3000 5000 10000 150000 20000
do      
        echo "Welcome $i times"

	for j1 in 4 10 20
        do
                for k1 in  20 100 500 1000
                do
                        echo "wrk -t ${j1} -c ${k1} -d30s -R ${i} -file_k 1 --latency $URL2" >> $FILEPATH
                        wrk -t${j1} -c${k1} -d30s -R${i} --latency $URL2 >> $FILEPATH
                done
                sleep 10
        done

	for j2 in 4 10 20
        do
                for k2 in  20 100 500 1000
                do
                        echo "wrk -t ${j2} -c ${k2} -d30s -R ${i} -file_k 111 --latency $URL3" >> $FILEPATH
                        wrk -t${j2} -c${k2} -d30s -R${i} --latency $URL3 >> $FILEPATH
                done
                sleep 10
        done
done
