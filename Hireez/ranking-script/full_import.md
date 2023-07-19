<!-- dump file path -->

<!-- test -->
s3://hiretual-ml-data-test/dump_profile/test/
aws s3 cp s3://hiretual-ml-data-test/dump_profile/test/0000.json .
<!-- prod: -->
s3://hiretual-ml-data/dump_profile/prod/


# docker build/run full import
<!-- 拉代码 -->
scp -P 9997 -r root@10.100.10.217:/root/ranking-engine .
<!-- cd ranking-engine -->
cd ranking-engine/
<!-- docker build -->
docker build -f docker/Dockerfile -t full_import \
--build-arg SCRIPT_NAME=/root/ranking_engine/docker/run_aisourcing_process.sh \
--build-arg ARGS="--operator=full_import --source=s3://hiretual-ml-data-test/dump_profile/test/ \
--save_path=/root/pika/" \
--build-arg PROCESSES=15 .

<!-- docker run -->
docker run -d --name full_import -e ENV=test --network host \
-v /home/spftest/ranking-engine/:/root/ranking-engine/ \
-v /data2/resume/pika/:/root/pika \
-v /data2/ML-Engine_Meta:/root/ML-Engine_Meta \
full_import

docker logs -f full_import


# stage server 
<!-- stage server  -->
git clone git@github.com:HireTeamMate/ranking-engine.git

<!-- replace settings.py -->


<!-- docker build -->
docker build -f docker/Dockerfile -t full_import \
--build-arg SCRIPT_NAME=/root/ranking_engine/docker/run_aisourcing_process.sh \
--build-arg ARGS="--operator=full_import --source=s3://hiretual-ml-data-test/dump_profile/stage/ \
--save_path=/root/pika/" \
--build-arg PROCESSES=7 .

<!-- docker run -->
docker run -d --name full_import -e ENV=test --network host \
-v /efs/resume/pika/:/root/pika \
-v /efs/ML-Engine_Meta:/root/ML-Engine_Meta \
full_import

docker logs -f full_import







<!-- prod server  -->
<!-- prod server  -->
<!-- prod server  -->
docker build -f docker/Dockerfile -t full_import \
--build-arg SCRIPT_NAME=/root/ranking_engine/docker/run_aisourcing_process.sh \
--build-arg ARGS="--operator=full_import --source=s3://hiretual-ml-data/dump_profile/prod_test/ \
--save_path=/root/pika/" \
--build-arg PROCESSES=16 .

<!-- docker run -->
docker run -d --name full_import -e ENV=test --network host \
-v /efs/resume/pika/:/root/pika \
-v /efs/ML-Engine_Meta:/root/ML-Engine_Meta \
full_import

docker logs -f full_import








# stage server 
<!-- stage server  -->
git clone git@github.com:HireTeamMate/ranking-engine.git

<!-- replace settings.py -->


<!-- docker build -->
docker build -f docker/Dockerfile -t full_import \
--build-arg SCRIPT_NAME=/root/ranking_engine/docker/run_aisourcing_process.sh \
--build-arg ARGS="--operator=title_skill_data --source=s3://hiretual-ml-data-test/dump_profile/stage/ \
--save_path=/root/pika/" \
--build-arg PROCESSES=1 .

<!-- docker run -->
docker run -d --name full_import -e ENV=test --network host \
-v /efs/resume/pika/:/root/pika \
-v /efs/ML-Engine_Meta:/root/ML-Engine_Meta \
full_import

docker logs -f full_import



# eks job

# stage
--operator fullimport --source s3://hiretual-ml-data-test/dump_profile/test/ --columnar cosent --dump_date 07182023
# stage-client 
--operator fullimport --source s3://hiretual-ml-data-test/dump_profile_client/test/ --columnar cosent --dump_date 07182023-client



shpf/cosent-ranking-release/ML-495