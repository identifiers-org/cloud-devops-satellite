#!/usr/bin/env bash
# Configuring a kubernetes cluster on AWS for experiments
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

function logdevops() {
    log DEVOPS $@
}

# Tools
KOPS=$(~/apps/bin/kops)

# Cluster parameters
export cluster_name=experimental.k8s.local
export KOPS_STATE_STORE=s3://mbdebian-k8s-experimental-state-store
export cluster_zones="eu-north-1a"
export s3_bucket_region="eu-north-1"

# Show information
loginfo "Cluster configuration for"
loginfo "\tName: '$cluster_name'"
loginfo "\tState: '$KOPS_STATE_STORE'"

# Create S3 bucket
logdevops "Creating bucket '$KOPS_STATE_STORE', region '$s3_bucket_region'"
aws s3api create-bucket \
    --bucket $KOPS_STATE_STORE \
    --create-bucket-configuration LocationConstraint=$s3_bucket_region \
    --region $s3_bucket_region
logdevops "Enabling versioning on '$KOPS_STATE_STORE'"
aws s3api put-bucket-versioning --bucket $KOPS_STATE_STORE  --versioning-configuration Status=Enabled

# Create cluster SSH public key
# Not yet

# Create cluster configuration
$KOPS create cluster --name=$cluster_name \
  --state=$KOPS_STATE_STORE --zones=$cluster_zones \
  --node-count=3 --node-size=t3.small --master-size=t3.small