FROM ubuntu:20.04

#设置环境变量
ENV LC_ALL C.UTF-8

#安装软件
RUN apt-get update -y &&
    apt-get -y install iputils-ping &&
    apt-get -y install wget &&
    apt-get -y install net-tools &&
    apt-get -y install vim &&
    apt-get -y install openssh-server &&
    apt-get -y install python3.9 &&
    apt-get -y install python3-pip python3-dev &&
    cd /usr/local/bin &&
    rm -f python &&
    rm -f python3 &&
    rm -f pip &&
    rm -f pip3 &&
    ln -s /usr/bin/python3.9 python &&
    ln -s /usr/bin/python3.9 python3 &&
    ln -s /usr/bin/pip3 pip &&
    ln -s /usr/bin/pip3 pip3 &&
    python -m pip install --upgrade pip &&
    apt-get clean &&
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

ADD ./init_ubuntu.sh /root
RUN bash /root/init_ubuntu.sh && rm -rf /root/init_ubuntu.sh

#开始ssh服务
CMD ["/usr/sbin/sshd", "-D", "-p 9999"]
