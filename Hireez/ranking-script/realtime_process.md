## docker 
# docker build/run realtime_process
<!-- 拉代码 -->
scp -P 9997 -r root@10.100.10.217:/root/ranking-engine .
<!-- cd ranking-engine -->
cd ranking-engine/
<!-- docker build -->
docker build -f docker/Dockerfile -t realtime_process \
--build-arg SCRIPT_NAME=/root/ranking_engine/docker/run_aisourcing_process.sh \
--build-arg ARGS="--operator=realtime_process" \
--build-arg PROCESSES=1 .

<!-- docker run -->
docker run -d --name realtime_process -e ENV=test --network host \
-v ~/ML-Engine_Meta:/root/ML-Engine_Meta \
realtime_process

docker logs -f realtime_process








# delete 
docker stop aisourcing
docker rm aisourcing 
docker rmi aisourcing:latest 
cd ..
rm -rf ranking-engine/

# start 
# aisourcing
scp -P 9997 -r root@10.100.10.19:/root/ranking-engine .
cd ranking-engine/
docker build -f docker/Dockerfile -t aisourcing --build-arg SCRIPT_NAME=/root/ranking_engine/docker/run_main_program.sh --build-arg ARGS="--app_name=aisourcing" --build-arg PROCESSES=4 .
docker run -d --name aisourcing --cpus=4 --memory=15m -e ENV=test --network host -v ~/ML-Engine_Meta:/root/ML-Engine_Meta aisourcing
docker logs -f aisourcing