#!/bin/bash
cd ~/HOWPOWERFUL/powerful-gnns-master
for dir in $(ls dataset)
do
       	echo $dir
	python main.py --dataset $dir  --filename "train_$dir.txt"
done
