#!/bin/bash
###############################
# Name : Mohammad Shadulla
# Date : 23 april 2026

# This script will report AWS resource usage
################################

set -x

# AWS S3
# AWS EC2
# AWS Lambda
# AWS IAM Users


# Lists S3 Buckets
echo "Print list of S3 Buckets"
aws s3 ls

# lists EC2 Instances
echo "print list of EC2 Instances"
aws ec2 describe-instances | jp '.Reservations[].Instances[].InstanceId'

#lists Lambda
echo "Print list of Lambda Functions"
aws lamnda list-functions

#lists IAM users
echo "Print list of IAM users"
aws iam list-users
