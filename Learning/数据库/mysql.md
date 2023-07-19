# 新建一个mysql database ranking engine
jira ticket https://hiretual.atlassian.net/browse/IM-6805
jenkins 流水线 https://jenkins.test1.hireez.info/job/databases/job/mysql/job/ranking_engine/job/Initialize/
测试 是否成功
需要在本地装一堆环境
https://hiretual.atlassian.net/wiki/spaces/HDD/pages/2236876027/Service+deployment+tutorial#Step-III---CICD
https://hiretual.atlassian.net/wiki/spaces/HML/pages/2230583337/1.+awsso

成功
 > /secrets/db/mysql/ranking_engine/user/ranking_engine_w
   /secrets/db/mysql/ranking_engine/user/ranking_engine_r

# mysql 客户端


mysqlworkbench

    "username": "admin"
    "password": "LAQ8XNJBWS5d4ea"
    "host": "mysql-te.db.testhtm",
    "port": "3306",
    mysql -uadmin -h mysql-te.db.testhtm ranking_engine -pLAQ8XNJBWS5d4ea

1. 新建一个schema
2. 新建一张表
3. 定义表的字段
   字段类型，https://www.w3schools.com/mysql/mysql_datatypes.asp
   字段解释，https://www.tutorialspoint.com/what-do-column-flags-mean-in-mysql-workbench

   insert



1. 建库， ranking engine
2. 建表， project_center
3. 





我新建了一个database 叫 ranking_engine , 加了一个账号，
ranking_engine_w: “master”
secret manger 的key 应该怎么写



stage 环境
mysql -uadmin -h mysql-te.db.testhtm ranking_engine -pLAQ8XNJBWS5d4ea

