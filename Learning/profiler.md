
export OMP_NUM_THREADS=1
export PROCESSES=4

echo $OMP_NUM_THREADS
echo $PROCESSES

mprof run --multiprocess /root/ranking-engine/src/service/server.py --app_name aisourcing
mprof plot --flame -o memory.png


mprof run /root/ranking-engine/src/service/server.py --app_name aisourcing

# service
nohup python3 -m src.service.server --app_name aisourcing &

# test
nohup python3 -m src.curl.aisourcing_request &


nohup python3 -m test.models.general_diff.company_industries_presave &