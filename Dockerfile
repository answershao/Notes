FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y openssh-server && \
    mkdir /var/run/sshd
# Set root password for SSH access (change 'your_password' to your desired password)
RUN echo 'root:1' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

# FROM ubuntu:20.04

# #设置环境变量
# ENV LC_ALL=C.UTF-8

# RUN apt-get update -y && \
#     apt-get -y install iputils-ping && \
#     apt-get -y install wget && \
#     apt-get -y install net-tools && \
#     apt-get -y install vim && \
#     apt-get -y install openssh-server && \
#     apt-get -y install openssh-client && \
#     mkdir -p /var/run/sshd && \
#     apt-get install -y locales && \
#     rm -rf  /tmp/* /var/lib/apt/lists/* /var/tmp/*

# 开始ssh服务
# CMD ["/usr/sbin/sshd", "-D", "-p 9999"]

# FROM registry.gitlab.com/islandoftex/images/texlive:latest
# docker run --name test -d --network host ubuntu "/usr/sbin/sshd" "-D" "-p 50002"





