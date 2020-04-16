# powerful-gnns-paper-reproduce
论文HOWPOWERFUL ARE GNNs复现代码
main.py:
改写自原程序
使用方式：选取合适的超参数，直接运行main.py，参数意义见程序内帮助
将在工作路径下建立<数据集名>目录，并在其中生成包含训练精度与测试精度的.txt文件
注意：程序引用了plot.py

plot.py
自编绘图程序
使用方式：选取合适的参数，直接运行plot.py，参数意义见程序内帮助
将在工作路径下建立Fig目录，并在其中生成对应名称的图片。

手动复现过程（训练部分）：
调整超参数，对所有数据集分别使用main生成txt文件，然后通过plot绘图

实例：复现数据集NCI1结果
运行以下代码获得txt文件
	python main.py --dataset NCI1 --filename "train_bio_NCI1_Sum_MLP(GIN-eps)_hid64_b128_d0.5_e350.txt" --learn_eps --graph_pooling_type average --hidden_dim 64 --batch_size 128 --final_dropout 0.5 --epochs 350 
	python main.py --dataset NCI1 --filename "train_bio_NCI1_Sum_MLP(GIN-0)_hid64_b128_d0.5_e350.txt" --graph_pooling_type average --hidden_dim 64 --batch_size 128 --final_dropout 0.5 --epochs 350
	python main.py --dataset NCI1 --filename "train_bio_NCI1_Sum_1-layer_hid64_b128_d0.5_e350.txt" --num_mlp_layers 1 --graph_pooling_type average --hidden_dim 64 --batch_size 128 --final_dropout 0.5 --epochs 350 
	python main.py --dataset NCI1 --filename "train_bio_NCI1_Mean_MLP_hid64_b128_d0.5_e350.txt" --neighbor_pooling_type average --graph_pooling_type average --hidden_dim 64 --batch_size 128 --final_dropout 0.5 --epochs 350 
	python main.py --dataset NCI1 --filename "train_bio_NCI1_Mean_1-layer_hid64_b128_d0.5_e350.txt" --neighbor_pooling_type average --num_mlp_layers 1 --graph_pooling_type average --hidden_dim 64 --batch_size 128 --final_dropout 0.5 --epochs 350 
	python main.py --dataset NCI1 --filename "train_bio_NCI1_Max_MLP_hid64_b128_d0.5_e350.txt" --neighbor_pooling_type max --graph_pooling_type average --hidden_dim 64 --batch_size 128 --final_dropout 0.5 --epochs 350 --device $5
	python main.py --dataset NCI1 --filename "train_bio_NCI1_Max_1-layer_hid64_b128_d0.5_e350.txt" --neighbor_pooling_type max --num_mlp_layers 1 --graph_pooling_type average --hidden_dim 64 --batch_size 128 --final_dropout 0.5 --epochs 350 
运行以下代码获得图像	
	python plot.py --dataset NCI1 --data_type Train --suffix _hid64_b128_d0.5_e350
	
自动复现过程（训练部分）：
提供自编shell脚本供调参：运行source tune_bio_fun_e.sh 可得函数及参数提示。后使用函数 tune_bio_fun_e +参数即可
同理有 tune_soc_fun.sh
区别为第一个是生物学信息，第二个是社交信息，某些超参数有不同。

（其实还提供自动绘图脚本）

以上，错了不管
