#!/bin/bash
cd ~/HOWPOWERFUL/powerful-gnns-master
for dir in MUTAG PTC NCI1 PROTEINS
do
	echo $dir
	python main.py --dataset $dir --filename "train_bio_${dir}_Sum_MLP(GIN-eps)" --learn_eps
	python main.py --dataset $dir --filename "train_bio_${dir}_Sum_MLP(GIN-0)"
	python main.py --dataset $dir --filename "train_bio_${dir}_Sum_1-layer" --num_mlp_layers 1
	python main.py --dataset $dir --filename "train_bio_${dir}_Mean_MLP" --neighbor_pooling_type average
	python main.py --dataset $dir --filename "train_bio_${dir}_Mean_1-layer" --neighbor_pooling_type average --num_mlp_layers 1
	python main.py --dataset $dir --filename "train_bio_${dir}_Max_MLP" --neighbor_pooling_type max
	python main.py --dataset $dir --filename "train_bio_${dir}_Max_1-layer" --neighbor_pooling_type max --num_mlp_layers 1
done

for dir in COLLAB, IMDBBINARY, IMDBMULTI, REDDITBINARY REDDITMULTI5K
do
	echo $dir
	python main.py --dataset $dir --filename "train_soc_${dir}_Sum_MLP(GIN-eps)" --learn_eps --graph_pooling_type average
	python main.py --dataset $dir --filename "train_soc_${dir}_Sum_MLP(GIN-0)" --graph_pooling_type average
	python main.py --dataset $dir --filename "train_soc_${dir}_Sum_1-layer" --num_mlp_layers 1 --graph_pooling_type average
	python main.py --dataset $dir --filename "train_soc_${dir}_Mean_MLP" --neighbor_pooling_type average --graph_pooling_type average
	python main.py --dataset $dir --filename "train_soc_${dir}_Mean_1-layer" --neighbor_pooling_type average --num_mlp_layers 1 --graph_pooling_type average
	python main.py --dataset $dir --filename "train_soc_${dir}_Max_MLP" --neighbor_pooling_type max --graph_pooling_type average
	python main.py --dataset $dir --filename "train_soc_${dir}_Max_1-layer" --neighbor_pooling_type max --num_mlp_layers 1 --graph_pooling_type average
done