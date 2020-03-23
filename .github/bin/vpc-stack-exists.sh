#!/bin/bash

# check if cloudformation stack exists

if ! aws cloudformation describe-stacks --region ${AWS_REGION} --stack-name "${stackName}"; then
    echo 'stack doesnt exist, creating ...' 
    aws cloudformation create-stack --stack-name "${stackName}" --template-url "${stackTemplateUrl}" --capabilities CAPABILITY_NAMED_IAM --parameters ParameterKey=env,ParameterValue="${env}" ParameterKey=SSHLocation,ParameterValue="${SSHLocation}"  
else
    echo 'stack exists, updating ...'
    aws cloudformation update-stack --stack-name "${stackName}" --template-url "${stackTemplateUrl}" --capabilities CAPABILITY_NAMED_IAM --parameters ParameterKey=env,ParameterValue="${env}" ParameterKey=SSHLocation,ParameterValue="${SSHLocation}"
fi

exit 0
