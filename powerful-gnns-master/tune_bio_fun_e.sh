#!/bin/bash
echo 'function for tune social dataset'
echo 'type'
echo 'tune_bio_fun_e <hidden units> <batchsize> <dropout ratio> <epoch> <device>'
echo 'to tune hyper params'

cd ~/HOWPOWERFUL/powerful-gnns-master
function tune_bio_fun_e {
	echo 'tune social dataset function:'
	echo 'hidden units:' $1
	echo 'batch size:' $2
	echo 'dropout ratio:' $3
	echo 'epoch:' $4
	echo 'device:' $5
	
for dir in MUTAG PTC NCI1 PROTEINS
do
	echo $dir
	python main.py --dataset $dir --filename "train_bio_${dir}_Sum_MLP(GIN-eps)_hid${1}_b${2}_d${3}_e${4}.txt" --learn_eps --graph_pooling_type average --hidden_dim $1 --batch_size $2 --final_dropout $3 --epochs $4 --device $5
	python main.py --dataset $dir --filename "train_bio_${dir}_Sum_MLP(GIN-0)_hid${1}_b${2}_d${3}_e${4}.txt" --graph_pooling_type average --hidden_dim $1 --batch_size $2 --final_dropout $3 --epochs $4 --device $5
	python main.py --dataset $dir --filename "train_bio_${dir}_Sum_1-layer_hid${1}_b${2}_d${3}_e${4}.txt" --num_mlp_layers 1 --graph_pooling_type average --hidden_dim $1 --batch_size $2 --final_dropout $3 --epochs $4 --device $5
	python main.py --dataset $dir --filename "train_bio_${dir}_Mean_MLP_hid${1}_b${2}_d${3}_e${4}.txt" --neighbor_pooling_type average --graph_pooling_type average --hidden_dim $1 --batch_size $2 --final_dropout $3 --epochs $4 --device $5
	python main.py --dataset $dir --filename "train_bio_${dir}_Mean_1-layer_hid${1}_b${2}_d${3}_e${4}.txt" --neighbor_pooling_type average --num_mlp_layers 1 --graph_pooling_type average --hidden_dim $1 --batch_size $2 --final_dropout $3 --epochs $4 --device $5
	python main.py --dataset $dir --filename "train_bio_${dir}_Max_MLP_hid${1}_b${2}_d${3}_e${4}.txt" --neighbor_pooling_type max --graph_pooling_type average --hidden_dim $1 --batch_size $2 --final_dropout $3 --epochs $4 --device $5
	python main.py --dataset $dir --filename "train_bio_${dir}_Max_1-layer_hid${1}_b${2}_d${3}_e${4}.txt" --neighbor_pooling_type max --num_mlp_layers 1 --graph_pooling_type average --hidden_dim $1 --batch_size $2 --final_dropout $3 --epochs $4 --device $5
done

}
