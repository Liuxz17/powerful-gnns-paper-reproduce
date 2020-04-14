#!/bin/bash
cd ~/HOWPOWERFUL/powerful-gnns-master
for dir in COLLAB IMDBBINARY IMDBMULTI REDDITBINARY REDDITMULTI5K
do
	echo $dir
	python main.py --dataset $dir --filename "train_soc_${dir}_Sum_MLP(GIN-eps).txt" --learn_eps --graph_pooling_type average --device 1
	python main.py --dataset $dir --filename "train_soc_${dir}_Sum_MLP(GIN-0).txt" --graph_pooling_type average --device 1
	python main.py --dataset $dir --filename "train_soc_${dir}_Sum_1-layer.txt" --num_mlp_layers 1 --graph_pooling_type average --device 1
	python main.py --dataset $dir --filename "train_soc_${dir}_Mean_MLP.txt" --neighbor_pooling_type average --graph_pooling_type average --device 1
	python main.py --dataset $dir --filename "train_soc_${dir}_Mean_1-layer.txt" --neighbor_pooling_type average --num_mlp_layers 1 --graph_pooling_type average --device 1
	python main.py --dataset $dir --filename "train_soc_${dir}_Max_MLP.txt" --neighbor_pooling_type max --graph_pooling_type average --device 1
	python main.py --dataset $dir --filename "train_soc_${dir}_Max_1-layer.txt" --neighbor_pooling_type max --num_mlp_layers 1 --graph_pooling_type average --device 1
done
