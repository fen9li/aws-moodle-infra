#!/bin/bash

# check if cloudformation stack exists

if ! aws cloudformation describe-stacks --region ${AWS_REGION} --stack-name "${stackName}"; then
    echo 'stack doesnt exist, creating ...' 
    aws cloudformation create-stack --stack-name "${stackName}" --template-url "${stackTemplateUrl}" --capabilities CAPABILITY_NAMED_IAM --parameters ParameterKey=env,ParameterValue="${env}" ParameterKey=VpcStackName,ParameterValue="${VpcStackName}" ParameterKey=DatabaseUsername,ParameterValue="${DBUsername}" ParameterKey=DatabasePassword,ParameterValue="${DBPassword}" 
else
    echo 'stack exists, updating ...'
    aws cloudformation update-stack --stack-name "${stackName}" --template-url "${stackTemplateUrl}" --capabilities CAPABILITY_NAMED_IAM --parameters ParameterKey=env,ParameterValue="${env}" ParameterKey=VpcStackName,ParameterValue="${VpcStackName}" ParameterKey=DatabaseUsername,ParameterValue="${DBUsername}" ParameterKey=DatabasePassword,ParameterValue="${DBPassword}"
fi

exit 0
