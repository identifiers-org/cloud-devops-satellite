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
KOPS="$HOME/apps/bin/kops"

# Cluster parameters
export cluster_name=experimental.k8s.local
export kops_bucket_name=mbdebian-k8s-experimental-state-store
export KOPS_STATE_STORE=s3://mbdebian-k8s-experimental-state-store
export cluster_zones="eu-north-1a"
export s3_bucket_region="eu-north-1"
export cluster_public_key_file="~/.ssh/bofh_aws_terraform.pub"

# Show information
loginfo "Cluster configuration for"
loginfo "\tName: '$cluster_name'"
loginfo "\tState: '$KOPS_STATE_STORE'"

# Create S3 bucket
logdevops "Creating bucket '$KOPS_STATE_STORE', region '$s3_bucket_region'"
aws s3api create-bucket \
    --bucket $kops_bucket_name \
    --create-bucket-configuration LocationConstraint=$s3_bucket_region \
    --region $s3_bucket_region
logdevops "Enabling versioning on '$KOPS_STATE_STORE'"
aws s3api put-bucket-versioning --bucket $kops_bucket_name  --versioning-configuration Status=Enabled

# Create cluster SSH public key
$KOPS create secret --name $cluster_name sshpublickey admin -i $cluster_public_key_file

# Create cluster configuration
$KOPS create cluster --name=$cluster_name \
  --state=$KOPS_STATE_STORE --zones=$cluster_zones \
  --node-count=3 --node-size=t3.small --master-size=t3.small