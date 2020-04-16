#!/bin/bash
cd ~/HOWPOWERFUL/powerful-gnns-master
echo 'plot'
function plot_fun () {
	echo 'plot result'
	echo 'category(all,bio,soc)' $1
	echo 'type(Test,Train)' $2
	echo 'suffix' $3
	
	if [ $1 = bio ]; then
	echo 'dds'
	
	for dir in MUTAG PTC NCI1 PROTEINS
	do
		echo $dir
		python plot.py --dataset $dir --data_type $2 --suffix $3
	done
	fi
	
	if [ $1 = soc ]; then
	for dir in COLLAB IMDBBINARY IMDBMULTI REDDITBINARY REDDITMULTI5K
	do
		echo $dir
		python plot.py --dataset $dir --data_type $2 --suffix $3
	done
	fi
	
	if [ $1 = all ]; then
	for dir in MUTAG PTC NCI1 PROTEINS COLLAB IMDBBINARY IMDBMULTI REDDITBINARY REDDITMULTI5K 
	do
		echo $dir
		python plot.py --dataset $dir --data_type $2 --suffix $3
	done
	fi
}
