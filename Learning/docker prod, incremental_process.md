# docker prod, incremental_process

本地盘: 新建目录  `/data2/resume/pika/`
docker映射: `/data2/resume/pika/:/root/pika`

tag: `v0.4.0-pika`



# docker test incremental_process
scp -P 9997 -r root@10.100.10.19:/root/ranking-engine .
cd ranking-engine/
docker build -f docker/Dockerfile -t incremental_process --build-arg SCRIPT_NAME=/root/ranking_engine/docker/run_aisourcing_process.sh --build-arg ARGS="--operator=incremental_process --data=s3://htm-test/PengfeiShao/profile_test/" --build-arg PROCESSES=2 .
docker run -d --name incremental_process -e ENV=test --network host -v /data2/resume/pika/:/root/pika  incremental_process
docker logs -f incremental_process
