# -*- coding: utf-8 -*-
"""
Created on Fri Apr 3 19:46:23 2020

@author: HJ
"""
import argparse
import numpy as np
import os
import matplotlib.pyplot as plt

def mkdir(path):
    path = path.strip()
    path = path.rstrip("/")
    isExists = os.path.exists(path)
    if not isExists:
        os.makedirs(path)
        print(path + ' 创建成功')
        return True
    else:
        print(path + ' 目录已存在')
        return False

def main():
    parser = argparse.ArgumentParser(description='poweful-gnns plot')
    parser.add_argument('--dataset', type=str, default="PROTEINS",
                        help='name of dataset (default: MUTAG)')
    parser.add_argument('--data_type', type=str, default="Train", choices=["Train", "Test"],
                        help='plot train or test data')
    parser.add_argument('--suffix', type=str, default="",
                        help='file suffix that describes hyperParameters')
    args = parser.parse_args()
    root = os.getcwd()+"/"+args.dataset
    file=os.listdir(root)
    data=[]
    curse_type=["WL-kernel","Sum_MLP(GIN-0)","Sum_MLP(GIN-eps)","Sum_1-layer","Mean_MLP","Mean_1-layer","Max_MLP","Max_1-layer"]
    color=["purple","red","orange","salmon","aqua","cyan","#01ff07","green"]
    style=['-','-','-','-.','-','-.','-','-.']
    linewidth=[1,1.5,1,1,1,1,1,1]
    label_idx=[]
    plt.figure(figsize=[12.8,9.6],dpi=300)
    flag=1
    if args.data_type=="Train":
        flag=1
    else:
        flag=2
    tmp=[]
    for ct,name in enumerate(curse_type):
        for fname in file:
            if name+args.suffix+".txt" in fname:
                tmp=np.loadtxt(args.dataset+"/"+fname,dtype=np.float32,delimiter=' ')
                data.append(tmp)
                epoch = range(1,len(tmp)+1)
                plt.plot(epoch, tmp[:,flag], label=curse_type[ct] ,c=color[ct], linestyle= style[ct], linewidth=linewidth[ct])
                break;
    
    
    """
    for i,f in enumerate(file):
        if not "txt" in f:
            continue
        tmp=np.loadtxt(args.dataset+"\\"+f,dtype=np.float32,delimiter=' ')
        data.append(tmp)
        epoch = range(1,len(tmp)+1)
        st=f.index(args.dataset)+len(args.dataset)+1
        ed=f.index(".")
        curse_name=f[st:ed]
        for ct in range(len(curse_type)):
            if curse_type[ct] in curse_name:
                label_idx.append(ct)
                plt.plot(epoch, tmp[:,1], label=curse_type[ct] ,c=color[ct], linestyle= style[ct], linewidth=linewidth[ct])
                break
    """
    plt.ylim(0,1)
    plt.xlim(0,len(tmp)+1)
    plt.legend()
    plt.ylabel(args.data_type+" Accuracy")
    plt.xlabel("Epoch")
    plt.title(args.dataset)
    dir=os.getcwd()+"/Fig"
    mkdir(dir)
    plt.savefig(dir+"/"+args.dataset+args.suffix+"-"+args.data_type+".jpg")
    
    
if __name__ == '__main__':
    main()
    
    
