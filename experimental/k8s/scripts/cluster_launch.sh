#!/usr/bin/env bash
# Launching a kubernetes cluster on AWS for experiments
# Author: Manuel Bernal Llinares <mbdebian@gmail.com>
function log() {
    echo -e "[] $@"
}
export cluster_name=experimental.k8s.local
export KOPS_STATE_STORE=s3://mbdebian-k8s-experimental-state-store
echo "--- Launch the cluster"
echo -e "\nName: '$cluster_name'"
echo -e "\nState: '$KOPS_STATE_STORE'"