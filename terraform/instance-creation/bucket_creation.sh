#!/bin/sh

##
# Author: Sea Lee
# Date: 2025. 4. 3.
# Description: create s3 bucket and dynamoDB table for terraform backend.
##


bucket_name="$1-terraform-state-bucket"
table_name="$1-terraform-lock-table"

if [ -z "$1" ]; then
  echo "Usage: $0 <proj-name>"
  exit 1
fi

# Check if AWS CLI is installed
aws s3api create-bucket --bucket ${bucket_name} --region ap-northeast-2 --create-bucket-configuration LocationConstraint=ap-northeast-2 > /dev/null
aws s3api put-bucket-versioning --bucket ${bucket_name} --versioning-configuration Status=Enabled > /dev/null
aws dynamodb create-table \
    --table-name ${table_name} \
    --attribute-definitions AttributeName=LockID,AttributeType=S \
    --key-schema AttributeName=LockID,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 > /dev/null
