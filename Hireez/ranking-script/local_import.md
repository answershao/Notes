# test server


<!-- 拉代码 -->
scp -P 9997 -r root@10.100.10.217:/root/ranking-engine .
<!-- cd ranking-engine -->
cd ranking-engine/
<!-- docker build -->
docker build -f docker/Dockerfile -t local_import \
--build-arg SCRIPT_NAME=/root/ranking_engine/docker/run_aisourcing_process.sh \
--build-arg ARGS="--operator=local_import --source=/root/resume-test/raw \
--save_path=/root/pika/" \
--build-arg PROCESSES=4 .

<!-- docker run -->
-v /home/shpf/ranking-engine/:/root/ranking-engine/ \

docker run -d --name local_import -e ENV=test --network host \
-v /data2/resume-test/raw:/root/resume-test/raw \
-v /data2/resume-test/pika/:/root/pika \
-v /data2/ML-Engine_Meta:/root/ML-Engine_Meta \
local_import


docker logs -f local_import



<!-- prod server  -->
<!-- prod server  -->

<!-- branch: -->
shpf/local-import
<!-- cd ranking-engine -->
cd ranking-engine/
<!-- prod server  -->
docker build -f docker/Dockerfile -t local_import \
--build-arg SCRIPT_NAME=/root/ranking_engine/docker/run_aisourcing_process.sh \
--build-arg ARGS="--operator=local_import --source=/root/resume/raw \
--save_path=/root/pika/" \
--build-arg PROCESSES=10 .

<!-- docker run -->
docker run -d --name local_import -e ENV=test --network host \
-v /efs//raw_source/dump_profile:/root/resume/raw \
-v /efs/resume/pika/:/root/pika \
-v /efs/ML-Engine_Meta:/root/ML-Engine_Meta \
local_import

docker logs -f local_import