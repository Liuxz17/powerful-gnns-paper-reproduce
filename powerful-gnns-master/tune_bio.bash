#!/bin/bash
cd ~/HOWPOWERFUL/powerful-gnns-master
for dir in MUTAG PTC NCI1 PROTEINS
do
	echo $dir
	python main.py --dataset $dir --filename "train_bio_${dir}_Sum_MLP(GIN-eps).txt" --learn_eps
	python main.py --dataset $dir --filename "train_bio_${dir}_Sum_MLP(GIN-0).txt"
	python main.py --dataset $dir --filename "train_bio_${dir}_Sum_1-layer.txt" --num_mlp_layers 1
	python main.py --dataset $dir --filename "train_bio_${dir}_Mean_MLP.txt" --neighbor_pooling_type average
	python main.py --dataset $dir --filename "train_bio_${dir}_Mean_1-layer.txt" --neighbor_pooling_type average --num_mlp_layers 1
	python main.py --dataset $dir --filename "train_bio_${dir}_Max_MLP.txt" --neighbor_pooling_type max
	python main.py --dataset $dir --filename "train_bio_${dir}_Max_1-layer.txt" --neighbor_pooling_type max --num_mlp_layers 1
done