## ml-engin-v2
    ```bash
    apt install -y libmysqlclient-dev libatlas-base-dev gfortran
    pip3 freeze > a.txt     
    pip3 uninstall -y -r a.txt

    # 卸载pack
    pip3 install boto3 Cython awscli python-json-logger

    CODEARTIFACT_TOKEN=`aws codeartifact get-authorization-token --domain hiretual --domain-owner 780323805217 --region us-east-1 --query authorizationToken --output text`
    CODEARTIFACT_URL=https://aws:$CODEARTIFACT_TOKEN@hiretual-780323805217.d.codeartifact.us-east-1.amazonaws.com/pypi/hiretual-pydao/simple/
    pip3 install hiretual-pydao --extra-index-url ${CODEARTIFACT_URL}
    echo '
    six~=1.15.0
    h5py~=2.10.0
    dill==0.3.3
    Flask==1.1.2
    inflection==0.5.1
    Keras==2.4.3
    numpy==1.19.2
    scipy~=1.6.0
    gensim~=3.2.0
    pandas==1.1.5
    pattern==3.6.0
    pycld2==0.41
    redis==3.1.0
    redis-py-cluster==2.1.0
    scikit-learn==0.24.1
    simplejson==3.17.2
    tensorflow==2.4.1
    protobuf==3.15.8
    confluent-kafka==1.7.0
    python-rapidjson
    gunicorn
    gevent
    ' > piplibs.txt
    pip3 install -r piplibs.txt
    python3 -c '
import nltk
nltk.download("stopwords")
'

# 开发不需要执行，
# gunicorn 是个独立的进程
# 部署运行用
    ```
gunicorn --timeout 60 --max-requests 1000 --worker-class gevent --workers=1 --access-logfile - --bind 0.0.0.0:6600 'src.api:create_app()'

aws s3 cp <> s3://htm-test/BaiXuefeng/
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
python3 -m src.transfer.download --env test
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



"astask_uids": ["fu597f4a1f7cce86.42465039", "impt_5b3dd422e3f422.72523042", "impt_5b2d31951c6098.19438116", "impt_5b3d9a2ca5daf0.51917347", "impt_5b2e1884665d77.11954003", "fu57586517888b06.95977888", "impt_5b2c727f3753a8.23509375", "213c7fb8-ca77-42ac-b86d-0228aee47837", "impt_5b5b41a3ce6db2.05595296", "fu575f12a6d61bf1.85534319", "impt_5b2e016e27c686.92479514"], "astask_uid2score": {}}root@dev-mlengine-3:~/




# 数据库不一致
v2, 
offline, kfaka2storage.py
只需要

# 数据存储：pika
# 1 存硬盘，redis是内存， 能够配合SSD，AWS
# 2 redis命中速度，比pika快，未命中，需要去查mysql,

# .vscode

python 文件， 
python -m 不会修改当前路径

y
# python 
# docker 
# linux

# ranking enigine: 0601b9a4-43bc-45b7-9afc-5052715dfc17
{'Xstage': '', 'client_id': 'htmtalent', 'Xit_expertise': {}, 'Xlocation': 'san jose, california', 'Xcountry': 'united states', 'Xcurrpos_token': [['software engineer']], 'Xcomp': {'currpos_tokens': [['software engineer']], 'prevpos_tokens': [['intern', 'kernel', 'networking'], ['student'], ['summer intern'], ['student']]}, 'Xstart': 24196, 'education_user': [{'education_degree': "master's degree", 'education_school': 'san jose state university'}, {'education_degree': "bachelor's degree", 'education_school': 'punjab technical university'}], 'Xsk_token_top': ['voip', 'c++', 'mpls', 'networking', 'data', 'cisco ios', 'my', 'microsoft excel', 'network virtualization', 'microsoft word', 'pursuing', 'vpn', 'active directory', 'cisco', 'for', 'puppet', 'jenkins', 'san', 'python', 'windows', 'electrical engineering', 'virtualization', 'openstack', 'xml', 'passionate', 'sip', 'test', 'communication', 'intern', 'ant', 'software engineer', 'dns', 'reporting', 'enthusiastic', 'tcp/ip', 'summer intern', 'student at', 'project management', 'ospf', 'testing', 'network programming', 'software engineer at', 'matlab', 'vmware', 'network security', 'ccna', 'ip', 'kernel', 'c', 'network', 'student', 'in'], 'Xsk_token_mid': ['arp', 'mininet', 'udp', 'gerrit', 'qos', 'pox', 'deterlab', 'vlan', 'honeypots', 'openvswitch', 'tcp', 'subnetting', 'eigrp', 'opnfv', 'network simulator', 'nat', 'linux', 'open vswitch', 'icmp', 'switching', 'spirent test center'], 'Xsk_token_low': ['network engineer', 'platform', 'challenge', 'cisco certified network associate', 'mention', 'as', 'routing and switching', 'troubleshoot'], 'Xclearance': [['ci poly', False], ['confidential', False], ['doe l', False], ['doe q', False], ['full scope\\/lifestyle', False], ['sci', False], ['secret', False], ['special access program', False], ['top secret', False], ['us agencies', False], ['us federal & defense contractors', False], ['us military base', False], ['top secret clearance', False], ['ts clearance', False], ['ts sci', False], ['ts-sci', False], ['ts/sci', False], ['top secret sci', False], ['full scope poly', False], ['ci poly', False], ['ssbi', False], ['dod', False], ['special agent', False], ['fbi', False], ['special access program', False], ['confidential', False], ['doe q', False], ['full scope/lifestyle', False], ['us veteran', False]]}
# v2
# main info
{'0601b9a4-43bc-45b7-9afc-5052715dfc17': 
{'Xstage': '', 'Xit_expertise': {}, 'Xcomp': {'currpos_tokens': [['software engineer']], 'prevpos_tokens': [['intern', 'kernel', 'networking'], ['student'], ['summer intern'], ['student']]}, 'Xcurrpos_token': [['software engineer']], 'Xstart': 24196, 'education_user': [{'education_degree': "master's degree", 'education_school': 'san jose state university'}, {'education_degree': "bachelor's degree", 'education_school': 'punjab technical university'}], 'skill_tokens': ['network security', 'electrical engineering', 'san', 'networking', 'virtualization', 'project management', 'python', 'xml', 'jenkins', 'networking', 'network', 'openstack', 'test', 'reporting', 'testing', 'cisco ios', 'tcp/ip', 'network security', 'network programming', 'ospf', 'voip', 'ip', 'mpls', 'vpn', 'openstack', 'dns', 'communication', 'windows', 'data', 'sip', 'microsoft excel', 'c++', 'microsoft word', 'matlab', 'c', 'vmware', 'active directory', 'ant', 'puppet', 'ccna'], 'highpos_tokens': ['in', 'engineer', 'software', 'electrical', 'masters', 'security', 'passionate', 'network virtualization', 'enthusiastic', 'cisco', 'summer', 'engineering'], 'current_title_tokens': ['software engineer'], 'rest_tokens': ['engineer', 'associate', 'switching', 'cisco certified network associate', 'network engineer', 'cisco certified', 'routing', 'platform', 'cisco', 'routing and switching', 'troubleshoot'], 'Xsk_token_mid': ['broadband', 'electronics', 'process', 'test scenarios', 'nat', 'arp', 'voice over ip', 'implementation', 'vtp', 'networks', 'switching', 'eigrp', 'qos', 'ids', 'sdn', 'penetration testing', 'openvswitch', 'h.323', 'openflow', 'dhcp', 'tests', 'tcp', 'lan', 'vlan', 'automated testing', 'udp', 'windows 7', 'packet tracer', 'system', 'ss7'], 'Xsk_token_low': ['associate', 'cisco certified network associate', 'network engineer', 'cisco certified', 'routing', 'platform', 'routing and switching', 'troubleshoot'], 'Xsk_token_top': ['project management', 'c++', 'network security', 'windows', 'microsoft excel', 'in', 'xml', 'engineer', 'kernel', 'ip', 'voip', 'network', 'jenkins', 'dns', 'summer intern', 'reporting', 'software', 'cisco ios', 'testing', 'electrical', 'test', 'masters', 'intern', 'c', 'active directory', 'ant', 'vmware', 'software engineer', 'security', 'openstack', 'san', 'network programming', 'python', 'microsoft word', 'student', 'data', 'passionate', 'networking', 'network virtualization', 'enthusiastic', 'ospf', 'vpn', 'matlab', 'ccna', 'cisco', 'communication', 'electrical engineering', 'sip', 'virtualization', 'puppet', 'tcp/ip', 'summer', 'engineering', 'mpls'], 'Xlocation': 'san jose, california', 'Xcountry': 'united states', 'Xclearance': <generator object _get_is_clearance_in_profile at 0x7fe039ccf510>, 'client_id': 'htmtalent'}}

# other info
{'0601b9a4-43bc-45b7-9afc-5052715dfc17': {'experience': '', 'degree': '', 'compensation': None, 'major': ['computer systems networking and telecommunications', 'electrical, electronics and communications engineering'], 'norm_location': {}, 'curr_company_size': [], 'industry': [], 'client_id': 'htmtalent'}}

