
# Jenkins test
<!-- 拉代码 -->
scp -P 9997 -r root@10.100.10.217:/root/ranking-engine .
<!-- cd ranking-engine -->
cd ranking-engine/
<!-- docker build -->
docker build -f docker/Dockerfile -t jenkins_test \
--build-arg SCRIPT_NAME=/root/ranking_engine/docker/test.sh \
--build-arg PROCESSES=1 .

<!-- docker run -->
docker run -d --name jenkins_test \
-e ENV=test \
--network host \
-v /data2/ML-Engine_Meta:/root/ML-Engine_Meta jenkins_test

# install git g++ bazel
apt-get -y install g++ git

# bazel
cd ~
wget https://github.com/bazelbuild/bazelisk/releases/download/v1.6.1/bazelisk-linux-amd64
chmod +x bazelisk-linux-amd64
ln -s ~/bazelisk-linux-amd64 /usr/bin/bazel
<!-- to test run:  -->
<!-- bazel version -->

# download 
wget https://github.com/protocolbuffers/protobuf/releases/download/v3.14.0/protobuf-all-3.14.0.tar.gz
tar -xf protobuf-all-3.14.0.tar.gz
cd protobuf-3.14.0
# compile
bazel build :protoc :protobuf
cp bazel-bin/protoc /usr/local/bin



