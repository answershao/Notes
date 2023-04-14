# test server

<!-- 拉代码 -->
scp -P 9997 -r root@10.100.10.217:/root/piper-rank .

<!-- cd piper-rank -->
cd piper-rank/
<!-- docker build -->
docker build -f docker/Dockerfile -t feature-platform \
--build-arg SCRIPT_NAME=/root/ranking_engine/docker/run_feature_process.sh.sh \
--build-arg ARGS="--start_time=feature-platform \
--start_date=2023-03-20 \
--end_date=2023-03-20 \
--runenv=prod" \
--build-arg PROCESSES=1 .

<!-- docker run -->
-v /home/shpf/ranking-engine/:/root/ranking-engine/ \

docker run -d --name feature-platform \
-v /mnt:/mnt \
feature-platform

docker logs -f feature-platform


# docker
sudo docker build -t bigdata-plat:v1 . 
&& sudo docker tag bigdata-plat:v1 285154157211.dkr.ecr.us-west-1.amazonaws.com/prod/ml/bigdata-plat:v23022401 
&& sudo docker push 285154157211.dkr.ecr.us-west-1.amazonaws.com/prod/ml/bigdata-plat:v23022401

aws ecr get-login-password --region us-west-1 | sudo docker login --username AWS --password-stdin 285154157211.dkr.ecr.us-west-1.amazonaws.com