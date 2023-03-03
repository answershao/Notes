01-29

1. aisourcing  latency 问题，明显增大，可能是由于VR流量增加导致的
2. prod pika 刷数据， 找data dump 数据
3. 推代码到release



01-30
1. qa test 
2. aisourcing latency 回归正常
3. 

01-31
aisourcing latency 又出问题了, 估摸着还是因为qps 设置的高了。（
task persona 截断问题， 生成原因，找红产看看。copy-paste 问题。（
task persona 功能集成。（启动aisourcing 附属服务，同时，集成）
数据已经dump结束。准备写入prod，2个进程去写。(pika proxy 挂掉了一个。 ERROR router is not online)，等pika 稳定之后再写入

02-01
新建一块pika， 同时切过来。复写数据，切过去


02-02
boolean builder 重启
aisourcingc 配置修改下，原来是1个core， 两个进程。修改为6core， 3个进程，内存不用动，涉及到配置的修改。


aisourcing
    1. 内存问题
    2. lb -> docker  (两种500的错误)
    3. 600ms -> multi_api -> 2s


02-03
black list 代码修改

02-13
代码 task optim 发布到 test
aisourcingc 需要设置成一个docker， 不能autoscale
jenkins-test

02-16
task persona 功能扩展，bug, 先保证task persona 的正常，try except 另外两个API
以及 替换title embedding 的问题
candidates black list 的问题，问Judy
personalize ranking 性能问题

02-17
task persona 优化title skill 识别
先保证task persona 的正常，try except 另外两个API
candidates black list 的问题，开个会议讨论下

02-20
embedding 上test
统计了公司的数据，5k，1w
在astask persona 加了gpt3的请求api

AIsourcing
astask：最大支持用户输入title/skill的个数 
（prod发生过一次把我们task_persona服务打挂掉的事故,用户输入100title，500skill。目前我们已经做了截断，上限定在100）
project：最大支持good fit上限 
（目前，前端从数据库取数据，性能下降比较严重。因此，这种project id过来的请求，前端不会给VR发请求）


02-21
发布的内容，观察stage

02-27 
整理分支
task persona 的测试问题，大小写问题
aisourcing - 

02-28
从小写恢复到原始， => task_persona/query_understand
主要还是关心boolean string 这一个key！

03-02
修复embedding逻辑 bug
开始看看 two tower embedding 架构的代码，需要重构


03-03
pika 重写数据，要通过efs。 efs 路径是什么
/raw_source/dump_profile_client
/raw_source/dump_profile

test 环境在s3，刷完再写一次。先用efs的搞一次。然后prod 搞起来

chatgpt 加日志，记录个数变化


1. yml 文件
2. 自动上传
3. 下载
4. 调用 新继承的类
5. 修改