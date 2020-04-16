#!/bin/bash
echo 'function for tune social dataset'
echo 'type'
echo 'tune_soc_fun <batchsize> <dropout ratio> <device>'
echo 'to tune hyper params'

cd ~/HOWPOWERFUL/powerful-gnns-master
function tune_soc_fun {
	echo 'tune social dataset'
	echo 'hidden units is fixed to 64'
	echo 'batch size:' $1
	echo 'dropout ratio:' $2
	echo 'device:' $3
	
for dir in REDDITBINARY REDDITMULTI5K
do
	echo $dir
	python main.py --dataset $dir --filename "train_soc_${dir}_Sum_MLP(GIN-eps)_hid64_b${1}_d${2}.txt" --learn_eps --graph_pooling_type average --hidden_dim 64 --batch_size $1 --final_dropout $2 --device $3
	python main.py --dataset $dir --filename "train_soc_${dir}_Sum_MLP(GIN-0)_hid64_b${1}_d${2}.txt" --graph_pooling_type average --hidden_dim 64 --batch_size $1 --final_dropout $2 --device $3
	python main.py --dataset $dir --filename "train_soc_${dir}_Sum_1-layer_hid64_b${1}_d${2}.txt" --num_mlp_layers 1 --graph_pooling_type average --hidden_dim 64 --batch_size $1 --final_dropout $2 --device $3
	python main.py --dataset $dir --filename "train_soc_${dir}_Mean_MLP_hid64_b${1}_d${2}.txt" --neighbor_pooling_type average --graph_pooling_type average --hidden_dim 64 --batch_size $1 --final_dropout $2 --device $3
	python main.py --dataset $dir --filename "train_soc_${dir}_Mean_1-layer_hid64_b${1}_d${2}.txt" --neighbor_pooling_type average --num_mlp_layers 1 --graph_pooling_type average --hidden_dim 64 --batch_size $1 --final_dropout $2 --device $3
	python main.py --dataset $dir --filename "train_soc_${dir}_Max_MLP_hid64_b${1}_d${2}.txt" --neighbor_pooling_type max --graph_pooling_type average --hidden_dim 64 --batch_size $1 --final_dropout $2 --device $3
	python main.py --dataset $dir --filename "train_soc_${dir}_Max_1-layer_hid64_b${1}_d${2}.txt" --neighbor_pooling_type max --num_mlp_layers 1 --graph_pooling_type average --hidden_dim 64 --batch_size $1 --final_dropout $2 --device $3
done

for dir in COLLAB IMDBBINARY IMDBMULTI
do
	echo $dir
	python main.py --dataset $dir --filename "train_soc_${dir}_Sum_MLP(GIN-eps)_hid64_b${1}_d${2}.txt" --learn_eps --graph_pooling_type average --hidden_dim 64 --batch_size $1 --final_dropout $2 --degree_as_tag --device $3
	python main.py --dataset $dir --filename "train_soc_${dir}_Sum_MLP(GIN-0)_hid64_b${1}_d${2}.txt" --graph_pooling_type average --hidden_dim 64 --batch_size $1 --final_dropout $2 --degree_as_tag --device $3
	python main.py --dataset $dir --filename "train_soc_${dir}_Sum_1-layer_hid64_b${1}_d${2}.txt" --num_mlp_layers 1 --graph_pooling_type average --hidden_dim 64 --batch_size $1 --final_dropout $2 --degree_as_tag --device $3
	python main.py --dataset $dir --filename "train_soc_${dir}_Mean_MLP_hid64_b${1}_d${2}.txt" --neighbor_pooling_type average --graph_pooling_type average --hidden_dim 64 --batch_size $1 --final_dropout $2 --degree_as_tag --device $3
	python main.py --dataset $dir --filename "train_soc_${dir}_Mean_1-layer_hid64_b${1}_d${2}.txt" --neighbor_pooling_type average --num_mlp_layers 1 --graph_pooling_type average --hidden_dim 64 --batch_size $1 --final_dropout $2 --degree_as_tag --device $3
	python main.py --dataset $dir --filename "train_soc_${dir}_Max_MLP_hid64_b${1}_d${2}.txt" --neighbor_pooling_type max --graph_pooling_type average --hidden_dim 64 --batch_size $1 --final_dropout $2 --degree_as_tag --device $3
	python main.py --dataset $dir --filename "train_soc_${dir}_Max_1-layer_hid64_b${1}_d${2}.txt" --neighbor_pooling_type max --num_mlp_layers 1 --graph_pooling_type average --hidden_dim 64 --batch_size $1 --final_dropout $2 --degree_as_tag --device $3
done
}
