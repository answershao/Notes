
scp -P 9997 -r root@10.100.10.217:/root/ranking-engine .
cd ranking-engine/
docker build -f docker/Dockerfile -t aisourcing \
--build-arg SCRIPT_NAME=/root/ranking_engine/docker/run_main_program.sh \
--build-arg ARGS="--app_name=aisourcing" \
--build-arg PROCESSES=4 .

docker run -d --name aisourcing --cpus="4" --memory="15g" -e ENV=test --network host \
-v /data2/ML-Engine_Meta:/root/ML-Engine_Meta \
aisourcing

docker logs -f aisourcing

# aisourcing Server Service
<!-- docker build -->
docker build -f docker/Dockerfile -t aisourcing \
--build-arg SCRIPT_NAME=/root/ranking_engine/docker/run_main_program.sh \
--build-arg ARGS="--app_name=aisourcing" \
--build-arg PROCESSES=4 .

<!-- docker run -->
docker run -d --name aisourcing \
-e ENV=test \
--network host \
-v ~/ML-Engine_Meta:/root/ML-Engine_Meta aisourcing



# test script run_main_program.sh
# manually

docker build -f docker/Dockerfile -t aisourcing \
--build-arg SCRIPT_NAME=/root/ranking_engine/docker/run_main_program.sh \
--build-arg ARGS="--app_name=aisourcing" \
--build-arg PROCESSES=2 .


docker build . -t shaopengfei \
--build-arg ARGS="--app_name=aisourcing"

docker run --name aisourcing -d --cap-add SYS_PTRACE --network host --restart always ubuntu_dev "/usr/sbin/sshd" "-D" "-p 9922"





# mlreview
scp -P 9997 -r root@10.100.10.217:/root/ranking-engine .
cd ranking-engine/
docker build -f docker/Dockerfile -t ranking_engine --build-arg SCRIPT_NAME=/root/ranking_engine/docker/run_main_program.sh --build-arg ARGS="--app_name=ml_review" --build-arg PROCESSES=4 .
docker run -d --name ml_review --cpus="4" --memory="15g" -e ENV=test --network host -v /data2/ML-Engine_Meta:/root/ML-Engine_Meta ranking_engine
docker logs -f ml_review

# aisourcing
scp -P 9997 -r root@10.100.10.217:/root/ranking-engine .
cd ranking-engine/
docker build -f docker/Dockerfile -t ranking_engine --build-arg SCRIPT_NAME=/root/ranking_engine/docker/run_main_program.sh --build-arg ARGS="--app_name=aisourcing" --build-arg PROCESSES=4 .
docker run -d --name aisourcing --cpus="4" --memory="15g" -e ENV=test --network host -v /data2/ML-Engine_Meta:/root/ML-Engine_Meta ranking_engine
docker logs -f aisourcing

