#!/bin/bash

wrk -t4 -c20 -d60s -T30s --latency http://192.168.1.4 > wrk1.txt
sleep(10)
wrk -t4 -c100 -d60s -T30s --latency http://192.168.1.4 >> wrk1.txt
sleep(10)
wrk -t4 -c500 -d60s -T30s --latency http://192.168.1.4 >> wrk1.txt
sleep(10)
wrk -t4 -c1000 -d60s -T30s --latency http://192.168.1.4 >> wrk1.txt
sleep(10)

wrk -t10 -c20 -d60s -T30s --latency http://192.168.1.4 >> wrk1.txt
sleep(10)
wrk -t10 -c100 -d60s -T30s --latency http://192.168.1.4 >> wrk1.txt
sleep(10)
wrk -t10 -c500 -d60s -T30s --latency http://192.168.1.4 >> wrk1.txt
sleep(10)
wrk -t10 -c1000 -d60s -T30s --latency http://192.168.1.4 >> wrk1.txt
sleep(10)

wrk -t20 -c20 -d60s -T30s --latency http://192.168.1.4 >> wrk1.txt
sleep(10)
wrk -t20 -c100 -d60s -T30s --latency http://192.168.1.4 >> wrk1.txt
sleep(10)
wrk -t20 -c500 -d60s -T30s --latency http://192.168.1.4 >> wrk1.txt
sleep(10)
wrk -t20 -c1000 -d60s -T30s --latency http://192.168.1.4 >> wrk1.txt
sleep(10)
