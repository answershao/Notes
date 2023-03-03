1. 删除old version pika
   1. heuritic, simialr, get_rank_insights
      1. QA test
      2. release 0202-2023
   2. embedding 
      1. QA test
      2. release XX

   ps, 汪晴已经在test环境切换了api， 不进入project 就是走的 heuristic
   
2. astask 性能测试
   1. task persona, embedding, 本地测试没啥问题
      1. embedding test 
         1. test 环境添加了函数日志
   2. add datadog, prod 环境进行观察 (12-26)
   
   3. task persona api，重新分配API 所在的服务！根据性能接受的情况。
   

3. query understanding 
   1. 集成 task persona, logic tree, embedding
   2. api 接口格式修改
   3. 对应修改
4. 布隆过滤器开发
   1. Kafka 搞定了吗？
   2. 单独启动一个docker 只能有一个docker，去消费，定数量去落盘（800），如果两个docker，怎么办？ mapreduce
   3. 
5. 



tip:


12-26
mlplat
astask payload 
datadog
12-27
astask persona 没有
12-28,29
release
12-30
embeding 性能问题，


1-2 
embeddding 卡在接口的任意一个位置，推断是模型的问题
1-3
对接一下 QA
task persona 测试一下
1-4
release, 
delete old verison pika
1-5
astask, 看了一些时间比较长的case，本地都挺快的。加日志。
本地复现，同样的请求，时间差别很大。

balck list 的逻辑，接一下test 环境的kafka

   一个docker，一个进程，每个进程启动两个handler，一个handler提供服务，另外一个接收kafka。
   由主handler 去触发一个while True 的Kafka 消费。
   接收kafka（定时落盘存到S3）


   # 初始化 
      indexFiles = [config.IVFPQ_ALL_FILE, config.IVFPQ_ALL_FILE_OLD]
   for item in indexFiles:
      if os.path.exists(item):
            self._index.Load(item)
            g_log.Info(f"Load index({item}) successfully, size:", self._index.Size())
            if buildIndex:
               self._index.Reset()
            break
   # 落盘
      tmp = config.IVFPQ_ALL_FILE + "_tmp"
      self._index.Save(tmp)
      if os.path.exists(config.IVFPQ_ALL_FILE):
            if os.path.exists(config.IVFPQ_ALL_FILE_OLD):
               os.remove(config.IVFPQ_ALL_FILE_OLD)
            os.rename(config.IVFPQ_ALL_FILE, config.IVFPQ_ALL_FILE_OLD)
            os.rename(tmp, config.IVFPQ_ALL_FILE)
            os.remove(config.IVFPQ_ALL_FILE_OLD)
      else:
            os.rename(tmp, config.IVFPQ_ALL_FILE)

   一个服务，多个接口，其中一个接口
   专门接kafka信息，内存中更新过滤器（加锁），服务下掉之前落盘。或者定时落盘（1小时）。
   多进程问题？ 
   多进程同步（不需要）？


1-6 
release, task persona 详细信息，排除是case/框架问题
怀疑是gc 的问题，开始测试. 排除gc的问题
专注于代码。是否有模型之类的问题


# astask
server 4 processes, reuqesst 1 
count  500.000000
mean     0.127417
std      0.059683
min      0.005257
10%      0.076851
50%      0.120327
90%      0.195306
95%      0.239724
99%      0.335710
max      0.643490


task persona 
server 1 processes, reuqesst 1 
mean     0.026844
std      0.112976
min      0.001987
10%      0.002085
50%      0.002308
90%      0.003480
95%      0.231136
99%      0.393488
max      1.353502

count  1000.000000
mean      0.026104
std       0.121015
min       0.001901
10%       0.002055
50%       0.002270
90%       0.004223
95%       0.209316
99%       0.382417
max       1.507895

mean      0.027036
std       0.125860
min       0.001910
10%       0.002040
50%       0.002306
90%       0.003964
95%       0.211795
99%       0.390500
max       1.578090




1-10 

hiretual logger 1 get_persona 0.30875205993652344 ms
hiretual logger 2 get_persona 0.3669261932373047 ms
{"name": "trace", "levelname": "INFO", "filename": "logger.py", "lineno": 177, "funcName": "wrapper", "log_time": "2023-01-10T11:00:04.629003Z", "msg": "", "service": "AISourcing", "type": "ML", "func": "get_persona", "time": 0, "status": "success", "return": "\"Success\"", "content": ""}
hiretual logger 3 get_persona 1673.2959747314453 ms
hiretual logger 3 get_persona 1673.3436584472656 ms


hiretual logger 1 get_persona 0.2846717834472656 ms
hiretual logger 2 get_persona 0.3364086151123047 ms
{"name": "trace", "levelname": "INFO", "filename": "logger.py", "lineno": 177, "funcName": "wrapper", "log_time": "2023-01-10T11:05:54.494854Z", "msg": "", "service": "AISourcing", "type": "ML", "func": "get_persona", "time": 0, "status": "success", "return": "\"Success\"", "content": ""}
hiretual logger 3 get_persona 1713.3128643035889 ms
hiretual logger 3 get_persona 1713.3822441101074 ms


删除了 get_message_str
{"name": "trace", "levelname": "INFO", "filename": "logger.py", "lineno": 177, "funcName": "wrapper", "log_time": "2023-01-10T11:16:00.083892Z", "msg": ""}
hiretual logger 3 success 0.20933151245117188 ms
hiretual logger 3 success 0.2269744873046875 ms
hiretual logger 1 main_process 1.1413097381591797 ms
hiretual logger 2 main_process 1.1544227600097656 ms
{"name": "trace", "levelname": "INFO", "filename": "logger.py", "lineno": 227, "funcName": "async_wrapper", "log_time": "2023-01-10T11:16:00.084060Z", "msg": ""}
hiretual logger 3 main_process 1327.1124362945557 ms
hiretual logger 3 main_process 1327.153205871582 ms



tracer.logger() 转移到 hiretual_logger 1-2 之间， 上面的结果是在2-3之间

{"name": "trace", "levelname": "INFO", "filename": "logger.py", "lineno": 176, "funcName": "wrapper", "log_time": "2023-01-10T11:22:25.285140Z", "msg": ""}
hiretual logger 2 success 0.23317337036132812 ms
hiretual logger 3 success 0.26154518127441406 ms
hiretual logger 3 success 0.27298927307128906 ms
hiretual logger 1 main_process 1.0342597961425781 ms
{"name": "trace", "levelname": "INFO", "filename": "logger.py", "lineno": 226, "funcName": "async_wrapper", "log_time": "2023-01-10T11:22:25.285341Z", "msg": ""}
hiretual logger 2 main_process 1030.029058456421 ms
hiretual logger 3 main_process 1030.0745964050293 ms
hiretual logger 3 main_process 1030.0862789154053 ms

如预测的，转移到了1-2 之间，

不是get_message_str的问题
===>>> 推导出，修改



# tracer.logger(),  前缀
{"name": "trace", "levelname": "INFO", "filename": "logger.py", "lineno": 179, "funcName": "wrapper", "log_time": "2023-01-10T12:25:21.277431Z", "msg": ""}

# 使用logger.info 替代 tracer logger， 结果显示，仍然存在问题
hiretual logger 1 success 0.0972747802734375 ms
{"name": "root", "levelname": "INFO", "filename": "logger.py", "lineno": 180, "funcName": "wrapper", "log_time": "2023-01-10T13:10:31.147992Z", "msg": "", "service": "AISourcing", "type": "ML", "func": "success", "time": 0, "status": "success", "return": "\"Success\"", "content": ""}
hiretual logger 2 success 0.37980079650878906 ms
hiretual logger 3 success 0.4115104675292969 ms
hiretual logger 1 main_process 1.2917518615722656 ms
{"name": "root", "levelname": "INFO", "filename": "logger.py", "lineno": 230, "funcName": "async_wrapper", "log_time": "2023-01-10T13:10:31.148317Z", "msg": "", "service": "AISourcing", "type": "ML", "func": "main_process", "time": 1, "status": "success", "return": "\"Success\"", "content": ""}
hiretual logger 2 main_process 1572.5736618041992 ms
hiretual logger 3 main_process 1572.6425647735596 ms


log request 1 0.062465667724609375 ms
{"name": "root", "levelname": "INFO", "filename": "logger.py", "lineno": 302, "funcName": "log_request", "log_time": "2023-01-10T13:36:41.252589Z", "msg": "", "tid": "", "service": "general", "type": "weblog", "func": "get_task_persona", "time": 0, "client": "10.100.10.217", "ret": 200, "method": "PUT", "host": "10.100.10.217", "status": "success", "hostip": "10.100.10.217"}
log request 2 1379.988670349121 ms

log request 1 0.04315376281738281 ms
{"name": "root", "levelname": "INFO", "filename": "logger.py", "lineno": 302, "funcName": "log_request", "log_time": "2023-01-10T13:39:17.031133Z", "msg": "", "tid": "", "service": "general", "type": "weblog", "func": "get_task_persona", "time": 0, "client": "10.100.10.217", "ret": 200, "method": "PUT", "host": "10.100.10.217", "status": "success", "hostip": "10.100.10.217"}
log request 2 1328.6323547363281 ms

log request 1 0.06198883056640625 ms
{"name": "root", "levelname": "INFO", "filename": "logger.py", "lineno": 302, "funcName": "log_request", "log_time": "2023-01-10T13:43:16.460581Z", "msg": "{'log_time': '2023-01-10T13:43:16.460419Z', 'tid': '', 'service': 'general', 'type': 'weblog', 'func': 'get_task_persona', 'time': 0, 'client': '10.100.10.217', 'ret': 200, 'method': 'PUT', 'host': '10.100.10.217', 'status': 'success', 'hostip': '10.100.10.217'}"}
log request 2 1358.8683605194092 ms

log request 1 0.0438690185546875 ms
{"name": "root", "levelname": "INFO", "filename": "logger.py", "lineno": 302, "funcName": "log_request", "log_time": "2023-01-10T13:43:53.524927Z", "msg": "{'log_time': '2023-01-10T13:43:53.524815Z', 'tid': '', 'service': 'general', 'type': 'weblog', 'func': 'get_task_persona', 'time': 0, 'client': '10.100.10.217', 'ret': 200, 'method': 'PUT', 'host': '10.100.10.217', 'status': 'success', 'hostip': '10.100.10.217'}"}
log request 2 1543.7521934509277 ms


深入logger内部
# code
   start = time.time()
   print(f"logging inner 0 {(time.time() - start) * 1000} ms", flush=True)
   if self.isEnabledFor(INFO):
      print(f"logging inner 1 {(time.time() - start) * 1000} ms", flush=True)
      self._log(INFO, msg, args, **kwargs)
      print(f"logging inner 2 {(time.time() - start) * 1000} ms", flush=True)

log request 1 0.04458427429199219 ms
logging inner 0 0.0011920928955078125 ms
logging inner 1 0.018358230590820312 ms
{"name": "root", "levelname": "INFO", "filename": "logger.py", "lineno": 302, "funcName": "log_request", "log_time": "2023-01-10T13:56:16.863622Z", "msg": "{'log_time': '2023-01-10T13:56:16.863479Z', 'tid': '', 'service': 'general', 'type': 'weblog', 'func': 'get_task_persona', 'time': 0, 'client': '10.100.10.217', 'ret': 200, 'method': 'PUT', 'host': '10.100.10.217', 'status': 'success', 'hostip': '10.100.10.217'}"}
logging inner 2 731.5378189086914 ms
log request 2 731.6570281982422 ms

# code
        print(f"logging inner 1 {(time.time() - start) * 1000} ms", flush=True)
        self.handle(record)
        print(f"logging inner 2 {(time.time() - start) * 1000} ms", flush=True)

logging inner 1 0.02956390380859375 ms
{"name": "root", "levelname": "INFO", "filename": "logger.py", "lineno": 302, "funcName": "log_request", "log_time": "2023-01-10T14:16:01.873065Z", "msg": "{'log_time': '2023-01-10T14:16:01.872920Z', 'tid': '', 'service': 'general', 'type': 'weblog', 'func': 'get_task_persona', 'time': 0, 'client': '10.100.10.217', 'ret': 200, 'method': 'PUT', 'host': '10.100.10.217', 'status': 'success', 'hostip': '10.100.10.217'}"}
logging inner 2 700.8311748504639 ms
log request 2 700.9730339050293 ms


hiretual logger 1 predict 2685.753345489502 ms
logging inner 1 0.0011920928955078125 ms
{"name": "root", "levelname": "INFO", "filename": "logger.py", "lineno": 180, "funcName": "wrapper", "log_time": "2023-01-10T15:06:51.699861Z", "msg": "", "service": "AISourcing", "type": "ML", "func": "predict", "time": 2686, "status": "success", "return": "\"Success\"", "content": ""}
logging inner 2 0.15282630920410156 ms
hiretual logger 2 predict 2686.177968978882 ms
hiretual logger 3 predict 2686.1929893493652 ms


hiretual logger 0 predict 0.001430511474609375 ms
hiretual logger 1 predict 3919.3835258483887 ms
logging inner 1 0.00095367431640625 ms
{"name": "root", "levelname": "INFO", "filename": "logger.py", "lineno": 180, "funcName": "wrapper", "log_time": "2023-01-10T15:14:36.797490Z", "msg": "", "service": "AISourcing", "type": "ML", "func": "predict", "time": 3919, "status": "success", "return": "\"Success\"", "content": ""}
logging inner 2 0.1533031463623047 ms
hiretual logger 2 predict 3919.804096221924 ms
hiretual logger 3 predict 3919.8122024536133 


logging inner 1 0.0011920928955078125 ms
logging inner 2, handler length: 1, 0.021696090698242188 ms
<LogRecord: root, 20, /root/ranking-engine/src/common/logger.py, 303, "{'log_time': '2023-01-11T03:01:23.037047Z', 'tid': '', 'service': 'general', 'type': 'weblog', 'func': 'get_task_persona', 'time': 0, 'client': '10.100.10.217', 'ret': 200, 'method': 'PUT', 'host': '10.100.10.217', 'status': 'success', 'hostip': '10.100.10.217'}">
{"name": "root", "levelname": "INFO", "filename": "logger.py", "lineno": 303, "funcName": "log_request", "log_time": "2023-01-11T03:01:24.133403Z", "msg": "{'log_time': '2023-01-11T03:01:23.037047Z', 'tid': '', 'service': 'general', 'type': 'weblog', 'func': 'get_task_persona', 'time': 0, 'client': '10.100.10.217', 'ret': 200, 'method': 'PUT', 'host': '10.100.10.217', 'status': 'success', 'hostip': '10.100.10.217'}"}
logging inner 3 1096.4703559875488 ms
log request 2 1096.6606140136719 ms



1-12
master 分支
health check 1w次，有0.8s
去掉log_request， 无卡顿， task api 卡顿严重
去掉hiretual logger中的logger， 去掉task payload 打印，无卡顿

switch task persona optim 分支
task persona 无卡顿
添加 log_function , 均卡顿

增加更新，修改log 格式。产生





运行1000次  控制台输出,logging: 0.4305839538574219 ms
运行1000次  控制台输出,loguru: 96.48513793945312 ms
运行1000次  python文件流方式输出到stdout: 6.700992584228516 ms
运行1000次  python文件流方式输出到文件: 0.568389892578125 ms
运行1000次  loguru文件流方式输出到文件: 753.4608840942383 ms

运行1000次  控制台输出,logging: 0.9181499481201172 ms
运行1000次  控制台输出,loguru: 99.27010536193848 ms
运行1000次  python文件流方式输出到stdout: 11.512517929077148 ms
运行1000次  python文件流方式输出到文件: 0.8440017700195312 ms
运行1000次  loguru文件流方式输出到文件: 470.3207015991211 ms

结论：

1.log写入文件效率高于stdout，优先选择写文件

2.log输出到控制台，直接print和定向到stdout的效率都低于以文件流的方式写入/dev/stdout，优先选择文件流写入

3.loguru写文件效率都较低，准备自己实现log简易功能

# 
运行1000次  控制台输出,logging: 0.4305839538574219 ms
运行1000次  控制台输出,logging: 567.3863887786865 ms




