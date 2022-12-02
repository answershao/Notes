# SSH key
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

## docker
dcoker ps -a 包含停止运行的容器
docker stats --no-stream <container_id>

<!-- 进入docker -->
docker exec -it b5c22591408b bash

# dev-mlengine-2
sudo useradd -d /home/spftest -m -G sudo -s /bin/bash spftest
sudo passwd spftest 

# docker group
sudo groupadd docker     #添加docker用户组
sudo gpasswd -a $USER docker     #将登陆用户加入到docker用户组中
newgrp docker     #更新用户组
docker ps    #测试docker命令是否可以使用sudo正常使用


## from docker file build images
aws s3 cp s3://htm-test/PengfeiShao/docker_file/ docker_file/ --recursive
# entry file content
(py3) ubuntu@ip-10-100-0-109:~/shpf$ docker build . -t shaopengfei
# 
docker run --name GaoYongzhan 
# 后台
-d 
# c++ docker 缺少权限
--cap-add SYS_PTRACE
# 网络模式 vmware , 缺少隔离
--network host
# 挂了就重启
--restart always 
# 目录映射
-v /data/GaoYongzhan/:/root 
# 工作目录/ image name
-w /root ubuntu_dev
# 执行命令
# ssh
"/usr/sbin/sshd"
# 不以后台方式启动
"-D" 
# 指定端口
"-p 9998"

docker run --name ml_engine -d --cap-add SYS_PTRACE --network host --restart always -v /home/shpf/ml_engine/:/root -w /root ubuntu_dev "/usr/sbin/sshd" "-D" "-p 9996"

# docker 修改容器的挂载目录
docker ps -a
docker commit container_id new_image_name
docker run --name ShaoPengfei -d --cap-add SYS_PTRACE --network host --restart always \
-v /data2/ML-Engine_Meta:/root/ML-Engine_Meta \
-v /data2/resume/:/root/resume/ \
-v /data2/resume-test/:/root/resume-test/ \
-v /data/ShaoPengfei/:/root/ \
-w /root ubuntu_dev_0722 "/usr/sbin/sshd" "-D" "-p 9993"

docker run --name TaoXinkai -d --cap-add SYS_PTRACE --network host --restart always \
-v /data1/TaoXinKai/:/root \
-v /data2/ML-Engine_Meta:/root/ML-Engine_Meta \
-v /data1/:/data1 \
-v /data2/:/data2 \
-w /root ubuntu_xinkai_0722 "/usr/sbin/sshd" "-D" "-p 9993"



 <!-- container !!!!! -->
 # container for ml_engine_v2
docker run --name ml_engine_v2 -d --cap-add SYS_PTRACE --network host --restart always -v /home/shpf/ml_engine_v2/:/root -w /root ubuntu_dev "/usr/sbin/sshd" "-D" "-p 9992"

docker run --name ml_engine_v2 -d --cap-add SYS_PTRACE --network host --restart always -v /home/spftest/ml_engine_v2/:/root -w /root shaopengfei "/usr/sbin/sshd" "-D" "-p 9992"

docker run --name ShaoPengfei-2 -d --cap-add SYS_PTRACE --network host --restart always -v /home/spftest/ml_engine_v2/:/root -w /root ubuntu_dev "/usr/sbin/sshd" "-D" "-p 9991"

<!-- exec -->
docker exec -it $container_name bash
<!-- vscode  config -->
ssh root@10.100.0.109 -p 9998
<!-- permission denied !!!!! -->
## 一定要修改！！！ docker root 密码！！！！
## 一定要修改！！！ docker root 密码！！！！
## 一定要修改！！！ docker root 密码！！！！
## 一定要修改！！！ docker root 密码！！！！
## 一定要修改！！！ docker root 密码！！！！

# linux/docker extensions
apt install git
apt install git-lfs


# vscode extensions
pylance
python extensions
python

git history
gitlens


# docker guide official / python 
<!-- https://docs.docker.com/language/python -->


## docker 
docker start
docker stop

# delete docker 
docker rm
docker rmi




# aisourcing Kafka Consumer
# docker build/run realtime_process
docker build -f docker/Dockerfile -t aisourcingc --build-arg SCRIPT_NAME=/root/ranking_engine/docker/run_aisourcing_process.sh --build-arg ARGS="--operator=realtime_process" --build-arg PROCESSES=1 .

docker run -d --name aisourcingc -e ENV=test --network host -v ~/ML-Engine_Meta:/root/ML-Engine_Meta aisourcingc

# docker build/run embedding
docker build -f docker/Dockerfile -t embedding --build-arg SCRIPT_NAME=/root/ranking_engine/docker/run_main_program.sh --build-arg ARGS="--app_name=embedding" --build-arg PROCESSES=1 .

docker run -d --name embedding -e ENV=test --network host -v ~/ML-Engine_Meta:/root/ML-Engine_Meta  embedding



## docker 
# docker build/run batch-embedding
<!-- 拉代码 -->
scp -P 9997 -r root@10.100.10.19:/root/ranking-engine .
<!-- cd ranking-engine -->
cd ranking-engine/
<!-- docker build -->
docker build -f docker/Dockerfile -t batch_embedding --build-arg SCRIPT_NAME=/root/ranking_engine/docker/run_aisourcing_process.sh --build-arg ARGS="--operator=batch_embedding --data=s3://hiretual-ml-data/dump_profile/test/" --build-arg PROCESSES=16 .
<!-- docker run -->
docker run -d --name batch_embedding -e ENV=test --network host -v /data2/resume/embedding/:/root/embedding  batch_embedding

# docker build/run full data import process
docker build -f docker/Dockerfile -t full_data_import_process --build-arg SCRIPT_NAME=/root/ranking_engine/docker/run_aisourcing_process.sh --build-arg ARGS="--operator=full_import --data=s3://hiretual-ml-data/dump_profile/test/" --build-arg PROCESSES=32 .

docker run -d --name full_data_import_process -e ENV=test --network host -v /data2/resume/pika/:/root/pika  full_data_import_process



# docker build/run full process
docker build -f docker/Dockerfile -t full_process --build-arg SCRIPT_NAME=/root/ranking_engine/docker/run_aisourcing_process.sh --build-arg ARGS="--operator=full_process" --build-arg PROCESSES=32 .

docker run -d --name full_process -e ENV=test --network host -v /data2/resume/pika/:/root/pika  full_process





## docker 
# docker build/run batch-embedding
<!-- 拉代码 -->
scp -P 9997 -r root@10.100.10.19:/root/ranking-engine .
<!-- cd ranking-engine -->
cd ranking-engine/
<!-- docker build -->
docker build -f docker/Dockerfile -t batch_embedding --build-arg SCRIPT_NAME=/root/ranking_engine/docker/run_aisourcing_process.sh --build-arg ARGS="--operator=batch_embedding --data=s3://hiretual-ml-data/dump_profile/prod/" --build-arg PROCESSES=16 .
<!-- docker run -->
docker run -d --name batch_embedding -e ENV=test --network host -v /data2/resume-test/embedding/:/root/embedding  batch_embedding


# delete 
docker stop aisourcing
docker rm aisourcing 
docker rmi aisourcing:latest 
cd ..
rm -rf ranking-engine/

# start 
# aisourcing
scp -P 9997 -r root@10.100.10.19:/root/ranking-engine .
cd ranking-engine/
docker build -f docker/Dockerfile -t aisourcing --build-arg SCRIPT_NAME=/root/ranking_engine/docker/run_main_program.sh --build-arg ARGS="--app_name=aisourcing" --build-arg PROCESSES=4 .
docker run -d --name aisourcing --cpus=4 --memory=15m -e ENV=test --network host -v ~/ML-Engine_Meta:/root/ML-Engine_Meta aisourcing
docker logs -f aisourcing

# 
# top
docker exec -it aisourcing bash
top



docker stop aisourcingc
docker rm aisourcingc
docker rmi aisourcingc:latest 
cd ..
rm -rf ranking-engine/

# aisourcing Kafka Consumer
# docker build/run realtime_process
scp -P 9997 -r root@10.100.10.19:/root/ranking-engine .
cd ranking-engine/
docker build -f docker/Dockerfile -t aisourcingc --build-arg SCRIPT_NAME=/root/ranking_engine/docker/run_aisourcing_process.sh --build-arg ARGS="--operator=realtime_process" --build-arg PROCESSES=1 .
docker run -d --name aisourcingc -e ENV=test --network host -v ~/ML-Engine_Meta:/root/ML-Engine_Meta aisourcingc
docker logs -f aisourcingc

# top
docker exec -it aisourcingc bash
top


# jenkins -test
cd ranking-engine/
docker build -f docker/Dockerfile -t jenkins_test --build-arg SCRIPT_NAME=/root/ranking_engine/docker/test.sh --build-arg PROCESSES=1 .
docker run -d --name jenkins_test -e ENV=test --network host -v ~/ML-Engine_Meta:/root/ML-Engine_Meta jenkins_test
docker logs -f jenkins_test


# docker prod, incremental_process

本地盘: 新建目录  `/data2/resume/pika/`
docker映射: `/data2/resume/pika/:/root/pika`

tag: `v0.4.0-pika`
docker build -f docker/Dockerfile -t incremental_process --build-arg SCRIPT_NAME=/root/ranking_engine/docker/run_aisourcing_process.sh --build-arg ARGS="--operator=incremental_process --data=s3://hiretual-ml-data/dump_profile/prod/" --build-arg PROCESSES=32 .
docker run -d --name incremental_process -e ENV=test --network host -v /data2/resume/pika/:/root/pika  incremental_process


<!-- docker run -d --name batch_embedding_server \
    -e PROCESSES=1 \
    -v /data2/ML-Engine_Meta:/root/ML-Engine_Meta \
    -v /data2/resume-test/raw:/root/resume/raw \
    -v /data2/resume-test/test_embedding2:/root/resume/embedding \
    -p 28888:8888 \
    batch_embedding:2022_03_15 \
    "bash" "/root/ranking_engine/docker/run_aisourcing_process.sh" \
    "--operator" "batch_embedding_server"

docker run -d --name batch_embedding_worker \
    -e PROCESSES=32 \
    -v /data2/ML-Engine_Meta:/root/ML-Engine_Meta \
    -v /data2/resume-test/raw:/root/resume/raw \
    -v /data2/resume-test/test_embedding2:/root/resume/embedding \
    batch_embedding:2022_03_15 \
    "bash" "/root/ranking_engine/docker/run_aisourcing_process.sh" \
    "--operator" "batch_embedding_worker" "--data" "ws://10.100.10.19:28888" -->




# python 3.9 docker 
scp -P 9997 -r root@10.100.10.217:/root/ranking-engine .

cd ranking-engine/
<!-- docker build -f docker/Dockerfile -t ubuntu_dev -->
docker run -m 10g --name ubuntu-py39 -d --cap-add SYS_PTRACE --network host --restart always \
-v /home/shpf/ranking-engine/:/root/ranking-engine/ \
-v /data2/ML-Engine_Meta:/root/ML-Engine_Meta \
-w /root ubuntu_dev "/usr/sbin/sshd" "-D" "-p 9933"

docker exec -it ubuntu-py39 bash
cd ranking-engine
cd docker 
sh init_docker.sh
