python


https://spark.apache.org/docs/latest/sql-getting-started.html

df.printSchema()

df.select("name").show()


如何执行多个任务？
推镜像，先登录，dev-5

aws ecr get-login-password --region us-west-1 | sudo docker login --username AWS --password-stdin 285154157211.dkr.ecr.us-west-1.amazonaws.com

# dev image
docker build -f docker/Dockerfile -t feature-platform:v1 . && docker tag feature-platform:v1 285154157211.dkr.ecr.us-west-1.amazonaws.com/dev/ml/feature-platform:v23061301 && docker push 285154157211.dkr.ecr.us-west-1.amazonaws.com/dev/ml/feature-platform:v23061301

# prod image
docker build -f docker/Dockerfile -t feature-platform:v1 . && docker tag feature-platform:v1 285154157211.dkr.ecr.us-west-1.amazonaws.com/prod/ml/feature-platform:v23051901 && docker push 285154157211.dkr.ecr.us-west-1.amazonaws.com/prod/ml/feature-platform:v23051901 

docker build -f docker/Dockerfile -t feature-platform:v1 . && docker tag feature-platform:v1 285154157211.dkr.ecr.us-west-1.amazonaws.com/prod/ml/feature-platform:v23052201 && docker push 285154157211.dkr.ecr.us-west-1.amazonaws.com/prod/ml/feature-platform:v23052201

docker build -f docker/Dockerfile -t feature-platform:v1 . && docker tag feature-platform:v1 285154157211.dkr.ecr.us-west-1.amazonaws.com/prod/ml/feature-platform:v23061301 && docker push 285154157211.dkr.ecr.us-west-1.amazonaws.com/prod/ml/feature-platform:v23061301

# 
rankunittest， 分支是哪一个，查看配置
stage/prod 新建schema 新建table
