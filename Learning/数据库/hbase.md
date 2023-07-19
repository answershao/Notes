# connnect hbase


# create table
sudo hbase shell
list

# create table
create 'talent_profile', {NAME => 'r', VERSIONS => 3}, SPLITS => ['1|', '2|', '3|', '4|', '5|', '6|', '7|', '8|', '9|', 'a|', 'b|', 'c|', 'd|', 'e|']

# scan
scan 'talent_profile', {LIMIT => 1}

# put
put 'test_hfile', 'row_key', 'r', 'value'


hbase org.apache.hadoop.hbase.mapreduce.ImportTsv -Dimporttsv.columns=a,b -Dimporttsv.bulk.output=hdfs://talent_profiles talent_profile hbase/

hbase org.apache.hadoop.hbase.mapreduce.ImportTsv -Dimporttsv.columns="HBASE_ROW_KEY,value," talent_profile -Dimporttsv.bulk.output=hdfs://10.100.2.199:/tmp/

# create table 
create 'test_hfile', {NAME => 'r', VERSIONS => 3}, SPLITS => ['1|', '2|', '3|', '4|', '5|', '6|', '7|', '8|', '9|', 'a|', 'b|', 'c|', 'd|', 'e|']
# have a look
describe 'test_hfile'
scan 'test_hfile', {LIMIT => 1}

# scp 
scp -P 9997 -r root@10.100.10.19:/root/ranking-engine .

file ==> hfile
# put file in HDFS
hdfs dfs -copyFromLocal hbase/ /tmp

# execute the Loadtsv statement as following
# bulk.output, 不直接写入hbase
time sudo hbase org.apache.hadoop.hbase.mapreduce.ImportTsv -Dimporttsv.columns='HBASE_ROW_KEY,r:data' -Dimporttsv.bulk.output=hdfs://10.100.2.199:/home/ssm-user/output/ test_hfile hdfs://10.100.2.199:/tmp/
# no bulk load
time sudo hbase org.apache.hadoop.hbase.mapreduce.ImportTsv -Dimporttsv.columns='HBASE_ROW_KEY,r:data' test_hfile hdfs://10.100.2.199:/tmp/
# talent_profile

time sudo hbase org.apache.hadoop.hbase.mapreduce.ImportTsv -Dimporttsv.columns='HBASE_ROW_KEY, r:data' -Dimporttsv.bulk.output=hdfs://storefile-outputdir <tablename> <hdfs-data-inputdir>

# hbase load
time sudo hbase org.apache.hadoop.hbase.mapreduce.LoadIncrementalHFiles hdfs://10.100.2.199:/tmp/ test_hfile

# automation
talent_offline.py 
1. full import  .tsv, map to efs/hbase
2. 


# manually trigger major compaction
#!/bin/bash
source /etc/profile
sh ./hbase shell <<EOF
balance_switch false
major_compact 'talent_profile'
balance_switch true
EOF


## aws hbase reconfig
s3://htm-test/PengfeiShao/aisourcing/awsHBaseReConfig.json

# test hbase master node
aws ssm start-session --target i-01f68c052fed5d0c8
# 查看 instance
aws emr describe-cluster --cluster-id j-1SMQM6JJ5AKAN --region us-west-1
aws emr list-instances --cluster-id j-1SMQM6JJ5AKAN --region us-west-1
# 查看master instancegroup id
"InstanceGroupId": "ig-2O7KIB880UDMX", 
# 执行
aws emr modify-instance-groups --cli-input-json file://instanceGroups.json --region us-west-1

<!-- instanceGroups.json -->
{
  "ClusterId": "j-1SMQM6JJ5AKAN",
  "InstanceGroups": [
    {
      "InstanceGroupId": "ig-2O7KIB880UDMX",
      "Configurations": [
        {
          "Classification": "hbase-site",
          "Properties": {
            "hbase.regionserver.handler.count": "100",
            "hbase.ipc.server.max.callqueue.length": "600",
            "hbase.hregion.majorcompaction": "604800000"
          },
          "Configurations": []
        }
      ]
    }
  ]
}
