
# https://hiretual.atlassian.net/wiki/spaces/HPD/pages/281051137/Using+Bash+Script+for+Shell+Access+to+EC2+Instances


# install aws
aws mac 

# configure
[default]
sso_start_url = https://hireteammate.awsapps.com/start
sso_region = us-west-2
sso_account_id = 780323805217
sso_role_name = MachineLearningEngineer
region = us-west-1
output = json
[profile MachineLearningEngineer-780323805217]
sso_start_url = https://hireteammate.awsapps.com/start
sso_region = us-west-2
sso_account_id = 780323805217
sso_role_name = MachineLearningEngineer
region = us-west-1
output = json


# ssmlogin 
#!/bin/bash
instance_name="$1"
if [ $# -lt 1 ]
then
    echo "USAGE: The AWS instance name is required"
    exit
fi
if [ ! -z $2 ]
then
    region=$2
else
    region='us-west-1'
fi
instance_id=$(aws ec2 describe-instances --filters \
"Name=tag:Name,Values=$instance_name" \
--query 'Reservations[*].Instances[*].[InstanceId]' --region $region \
| grep i- | awk '{print $1}' | tail -1 | tr -d '"')
echo 'Your session will be recorded for auditing'
echo 'Starting Hiretual AWS SSM session for the instance id '$instance_id
aws ssm start-session --target $instance_id --region $region
# ssmlogin dev-mlengine-3


# session
curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/mac/sessionmanager-bundle.zip" -o "sessionmanager-bundle.zip"
unzip sessionmanager-bundle.zip
sudo ./sessionmanager-bundle/install -i /usr/local/sessionmanagerplugin -b /usr/local/bin/session-manager-plugin


# sudo useradd -d /home/<username> -m -G sudo -s /bin/bash <username>sudo passwd <username>

# ssh root@10.100.10.19 -p 9997