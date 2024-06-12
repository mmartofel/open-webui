#!/bin/bash

# I'm about to label nodes with NVIDIA GPUs with custom label and use it at deployment with node selector

# Function to label nodes with NVIDIA GPUs
label_gpu_nodes() {
    # Get the list of nodes with NVIDIA GPUs
    gpu_nodes=$(oc get nodes -o json | jq -r '.items[] | select(.status.allocatable."nvidia.com/gpu" != null) | .metadata.name')

    # Loop through each GPU node and label it
    for node in $gpu_nodes; do
        echo "Labeling node $node with type=gpu-node"
        oc label node "$node" type=gpu-node --overwrite
    done
}

# Run the function
label_gpu_nodes

echo "Labeling complete."
