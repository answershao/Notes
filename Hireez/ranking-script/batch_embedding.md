<!-- new -->
docker run -d --name batch_embedding_server \
    -e PROCESSES=1 \
    -v /data2/ML-Engine_Meta:/root/ML-Engine_Meta \
    -v /data2/resume-test/raw:/root/resume/raw \
    -v /data2/resume-test/test_embedding2:/root/resume/embedding \
    batch_embedding:2022_03_15 \
    "bash" "/root/ranking_engine/docker/run_aisourcing_process.sh" \
    "--operator" "batch_embedding_server" \
    "--source" "/root/resume/raw/" \
    "--save_path" "/root/resume/embedding/"

docker run -d --name batch_embedding_worker \
    -e PROCESSES=32 \
    -v /data2/ML-Engine_Meta:/root/ML-Engine_Meta \
    -v /data2/resume-test/raw:/root/resume/raw \
    -v /data2/resume-test/test_embedding2:/root/resume/embedding \
    batch_embedding:2022_03_15 \
    "bash" "/root/ranking_engine/docker/run_aisourcing_process.sh" \
    "--operator" "batch_embedding_worker" \
    "--save_path" "/root/resume/embedding/" \
    "--server_addr" "ws://10.100.10.19:28888"


