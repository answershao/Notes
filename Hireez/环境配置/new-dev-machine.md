<!-- 挂载efs -->
mkdir -p /efs && umount /efs || echo 1; sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-0ef4f6941b034d588.efs.us-west-1.amazonaws.com:/ /efs


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
# docker build
docker build . -t shaopengfei

 <!-- container !!!!! -->
 # container for ranking_engine
docker run --name ranking_engine -d --cap-add SYS_PTRACE --network host --restart always -v /home/spftest/ranking_engine_data/:/root -w /root shaopengfei "/usr/sbin/sshd" "-D" "-p 9994"

# prod 
docker run --name ranking_engine -d --cap-add SYS_PTRACE --network host --restart always -v /efs/resume/embedding:/root/embedding/ -w /root shaopengfei "/usr/sbin/sshd" "-D" "-p 9994"
# 传输文件
scp -P 9992 -r root@10.100.10.117:/root/ranking-engine .


<!-- exec -->
docker exec -it $container_name bash
<!-- vscode  config -->
ssh root@10.100.0.109 -p 9994
<!-- permission denied !!!!! -->
## 一定要修改！！！ docker root 密码！！！！
## 一定要修改！！！ docker root 密码！！！！
## 一定要修改！！！ docker root 密码！！！！
## 一定要修改！！！ docker root 密码！！！！
## 一定要修改！！！ docker root 密码！！！！

<!-- docker 建立好之后, 先ssh到docker里, 再用vscode尝试ssh /// 也可能是安全组（找dev解决）-->

# vscode 进入 docker
ssh root@10.100.19 -p 9992

# 配置环境
<!-- bash -->
apt-get update
apt install git
apt install git-lfs
apt install sudo

# 拉指定分支
git clone -b develop git@github.com:HireTeamMate/ranking-engine.git

# 
apt-get install python3-venv
pip3 install virtualenv==20.4.3
# create environment called py38-re
python3.8 -m venv py38-re
source ~/py38-re/bin/activate

## py38 venv 环境下
# install jupyter 
我选择不装！

# vscode extensions
pylance
python extensions
git history
gitlens

# python3
apt install -y python3 python3-dev python3-pip
apt install -y python3-cryptography libatlas-base-dev gfortran
apt install -y libmysqlclient-dev
apt install -y libomp-dev
apt-get install libmysqlclient-dev

pip3 install mysqlclient
pip3 install -r /root/ranking-engine/requirements.txt

python3 -c '
import nltk
nltk.download("stopwords")
nltk.download("omw-1.4")
'

# 模型文件
python3 -m src.transfer.download_ranking_engine_models
cd /root/ML-Engine_Meta/
mkdir log


# embedding


scp -P 9992 -r root@10.100.10.117:/root/ranking-engine .
cd ranking-engine/

export OMP_NUM_THREADS=1
echo $OMP_NUM_THREADS
source ~/py38-re/bin/activate
nohup python3 -m src.offline.offline_server --operator full_process &

nohup python3 -m src.models.twotower_models.embedding &

nohup python3 -m src.offline.talent_profile_offline --data s3://hiretual-temp-data-transfer/miaoyan_trans/dump_users_test_20211012/ --multi 32 --operator full_import
