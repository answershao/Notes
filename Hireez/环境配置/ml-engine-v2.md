# 详细记录ml-engine-v2 docker安装过程

# pre
docker image: ubuntu_dev
 <!-- container !!!!! -->
 # container for ml_engine_v2
docker run --name spf_ml_engine_v2 -d --cap-add SYS_PTRACE --network host --restart always -v /home/shpf/ml_engine_v2_data/:/root -w /root ubuntu_dev "/usr/sbin/sshd" "-D" "-p 9992"
<!-- exec -->
docker exec -it spf_ml_engine_v2 bash
<!-- vscode  config -->
ssh root@10.100.0.19 -p 9992
<!-- permission denied !!!!! -->
## 一定要修改！！！ docker root 密码！！！！
## 一定要修改！！！ docker root 密码！！！！
## 一定要修改！！！ docker root 密码！！！！
## 一定要修改！！！ docker root 密码！！！！
## 一定要修改！！！ docker root 密码！！！！
# vscode 进入 docker
ssh root@10.100.19 -p 9992
# 配置环境
<!-- bash -->
apt-get update

apt install git
apt install git-lfs
apt install sudo

# 拉指定分支
git clone -b develop git@github.com:HireTeamMate/ml-engine-v2.git

# 
apt-get install python3-venv
pip3 install virtualenv==20.4.3
# create environment called py38
python3.8 -m venv py38
source ~/py38/bin/activate
## py38 venv 环境下

# install jupyter 
我选择不装！

# 切换到ml-engine-v2目录下
<!-- 重新进入 -->
source ~/py38/bin/activate
# vscode extensions
pylance
python extensions
python
git history
gitlens

# branch   新建分支
git checkout -b two_tower_embedding
git push --set_upstream origin two_tower_embedding
git branch -vv
# pip3 install 
    '''bash
    apt install -y libmysqlclient-dev libatlas-base-dev gfortran
    pip3 freeze > a.txt
    pip3 uninstall -y -r a.txt
    pip3 install boto3 Cython awscli python-json-logger
# install hiretual-pydao and hiretual-pylogging
###########################################################################################
pip3 install awscli==1.19.98
pip3 install boto3==1.17.47
sudo apt-get install libatlas-base-dev gfortran


# install hiretual-pydao and hiretual-pylogging
CODEARTIFACT_TOKEN=`aws codeartifact get-authorization-token --domain hiretual --domain-owner 780323805217 --region us-east-1 --query authorizationToken --output text`
CODEARTIFACT_URL=https://aws:$CODEARTIFACT_TOKEN@hiretual-780323805217.d.codeartifact.us-east-1.amazonaws.com/pypi/hiretual-pylogging/simple/
pip3 install hiretual-pylogging -i $CODEARTIFACT_URL

CODEARTIFACT_TOKEN=`aws codeartifact get-authorization-token --domain hiretual --domain-owner 780323805217 --region us-east-1 --query authorizationToken --output text`
CODEARTIFACT_URL=https://aws:$CODEARTIFACT_TOKEN@hiretual-780323805217.d.codeartifact.us-east-1.amazonaws.com/pypi/hiretual-pydao/simple/
pip3 install hiretual-pydao --extra-index-url $CODEARTIFACT_URL
pip3 install --upgrade pip

cd ml-engine-v2
# pip3 install --upgrade setuptools
pip3 install -r requirements.txt

scipy slowly...
###########################################################################################
# 修改vscode 解释器路径
/root/py38/bin/python3.8
# install protoc and compile
###########################################################################################
cd ~
mkdir tools
cd tools
mkdir bin
cd bin
PROTOC_ZIP=protoc-3.14.0-linux-x86_64.zip
curl -OL https://github.com/protocolbuffers/protobuf/releases/download/v3.14.0/$PROTOC_ZIP
sudo unzip -o $PROTOC_ZIP -d ~/tools bin/protoc
sudo unzip -o $PROTOC_ZIP -d ~/tools 'include/*'
rm -f $PROTOC_ZIP
cd ~/ml-engine-v2
sudo ~/tools/bin/protoc -I=src/service/database/protos --python_out=src/service/database/protos src/service/database/protos/xtoken.proto
sudo ~/tools/bin/protoc -I=src/service/database/protos --python_out=src/service/database/protos src/service/database/protos/extra_profile.proto
###########################################################################################
# download ML-engine_data
python3 -m src.transfer.download --env test
# cython
python3 setup.py build_ext --inplace
# add one line file called env.py in src.config
ENV = 'test'
# test 是否安装成功
python3 -c '
import nltk
nltk.download("stopwords")
'
from src.service.core.aisourcing.candidates_rank_heuristic import AISourcingEngine
###########################################################################################
## over！！！



##
aiohttp 测试例子
```bash
pip3 install aiohttp[speedups]
```
```py
from aiohttp import web
async def rank_candidates2(request):
    data = await request.json()
    res_json = AISourcingEngine.rank_candidates(data)
    return web.json_response(res_json)
if __name__ == "__main__":
    app = web.Application()
    app.add_routes(
        [
            web.get("/aisourcing/candidates_rank_heuristic", rank_candidates2),
            web.post("/aisourcing/candidates_rank_heuristic", rank_candidates2),
        ]
    )
    web.run_app(app, port=7788)

```
python3 -m src.api.view_sourcing
curl -i -X POST -H "Content-Type:application/json"  -H "X-API-KEY:Qro19LxU4rMbPqrSU2ymWJhHSeOCtq6e"    -d '{
    "relevance": "default",
    "search_history_id": "sadsadsadsafdsf",
    "is_new_search": true,
    "astask": {
      "astask_skills": ["restful api\u0027s"],
        "astask_recruiter_id": "team5f7f3242eaaa39.48546861",
        "astask_type": "general",
        "astask_savefolder_id": 90694,
        "astask_diversity_selection_type": "OR",
        "astask_range": "25km",
        "astask_sourcing_channel": [
            "hiretual",
            "ats",
            "import",
            "jobboard",
            "careerbuilder"
        ]
    },
    "es_uids": [
        "fu597f4a1f7cce86.42465039",
        "impt_5b2c727f3753a8.23509375",
        "fu57586517888b06.95977888",
        "impt_5b2e1884665d77.11954003",
        "impt_5b2e016e27c686.92479514",
        "impt_5b3d9a2ca5daf0.51917347",
        "impt_5b3dd422e3f422.72523042",
        "impt_5b5b41a3ce6db2.05595296",
        "213c7fb8-ca77-42ac-b86d-0228aee47837",
        "fu575f12a6d61bf1.85534319",
        "impt_5b2d31951c6098.19438116"
    ],
    "imported_uids_list": [],
    "client_id": "team586772d2e72f89.75609034"
}'  'http://10.100.10.19:7788/aisourcing/candidates_rank_heuristic'

