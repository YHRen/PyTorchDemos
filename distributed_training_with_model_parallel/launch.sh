#!/bin/bash
## for torch distributed launch
## **all the same, except  node_rank = 1**
nnodes=$1               # total number of nodes used in this computation
node_rank=$2            # current node rank, 0-indexed
nproc_per_node=4        # number of processes (models) per node
master_addr=$3          # hostname for the master node 
port=8888               # 

source activate torch13 ## Change To Your Environment Name
python -m torch.distributed.launch \
    --nproc_per_node ${nproc_per_node} \
    --nnodes ${nnodes} \
    --node_rank ${node_rank} \
    --master_addr ${master_addr} \
    --master_port 8888 \
    main.py \
    --groups_size 2 \
    --group_per_node ${nproc_per_node}
