<!-- set env variables -->
/etc/profile

# vi /etc/profile 
export CLASSPATH=./JAVA_HOME/lib;$JAVA_HOME/jre/lib 
注：修改文件后要想马上生效，还要运行source /etc/profile。不然只能在下次重进此用户时生效。

# vi /home/guok/.bash.profile 
export CLASSPATH=./JAVA_HOME/lib;$JAVA_HOME/jre/lib 
注：修改文件后要想马上生效，还要运行source /home/guok/.bash_profile。不然只能在下次重进此用户时生效。

# export命令定义变量【只对当前shell(BASH)有效(临时的)】



## 命令大全
<!-- https://github.com/mingongge/Learn-a-Linux-command-every-day -->

# file 
stat, 一般用于查看文件的状态信息
wc, 一般用于统计文件的信息，比如文本的行数，文件所占的字节数。
du, 一般用于统计文件和目录所占用的空间大小
ls, 一般用于查看文件和目录的信息，包括文件和目录权限、拥有者、所对应的组、文件大小、修改时间、文件对应的路径等等信息。
ll, 命令查看文件大小

# echo, displaying a text/string
# 软连接
ln -s $source path$ $des path$

# copy 文件
<!-- https://segmentfault.com/a/1190000038754092 -->
cp -i file dircp /usr/app/a.txt /usr/mingongge/b.txt  <b.txt不存在，创建b.txt文件>
cp /usr/app/a.txt /usr/mingongge/b.sh   <b.sh不存在，创建b.sh文件,类似改名功能>
cp /usr/app/a.txt /usr/mingongge/abc   <abc不存在，创建abc文件>


# 总核数 = 物理CPU个数 X 每颗物理CPU的核数 
# 总逻辑CPU数 = 物理CPU个数 X 每颗物理CPU的核数 X 超线程数

# 查看物理CPU个数
cat /proc/cpuinfo| grep "physical id"| sort| uniq| wc -l

# 查看每个物理CPU中core的个数(即核数)
cat /proc/cpuinfo| grep "cpu cores"| uniq

# 查看逻辑CPU的个数
cat /proc/cpuinfo| grep "processor"| wc -l


# 测试curl
curl -X PUT \
 -H "Content-Type:application/json" \
 -H "X-API-KEY:Qro19LxU4rMbPqrSU2ymWJhHSeOCtq6e" \
 "prod-mlengine-autoscaling-tmp-1163052003.us-west-1.elb.amazonaws.com:5000" -d '@text.json'

# user mangement
<!-- add, -s 非常重要 -->
sudo useradd -d -m -s /home/shpf shpf 
<!-- passwd -->
sudo passwd shpf
<!-- login -->
su - shpf
<!--  del -->
sudo userdel shpf

## IP/host
ifconfig

# 后台执行
nohup python3 -m test.xx &

# linux command
ls 
ls -a 
cat 
rm -r 
sudo 


for i in $(ls *.gz);do tar -xvf $i;done
for i in $(ls *.gz);do gzip -d $i;done

