#!/usr/bin/env bash
# Launching a kubernetes cluster on AWS for experiments
# Author: Manuel Bernal Llinares <mbdebian@gmail.com>

# Helpers
function log() {
    header="$1"
    shift
    echo -e "[$header] $@"
}

function loginfo() {
    log INFO $@
}

# Tools
KOPS=$(~/apps/bin/kops)

# Cluster parameters
export cluster_name=experimental.k8s.local
export KOPS_STATE_STORE=s3://mbdebian-k8s-experimental-state-store
export cluster_zones="eu-north-1a"

# Show information
loginfo "Launch the cluster"
loginfo "\tName: '$cluster_name'"
loginfo "\tState: '$KOPS_STATE_STORE'"

# Create cluster configuration
$KOPS create cluster 