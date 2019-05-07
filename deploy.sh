docker build -t hemanthtm2/multi-client:latest -t hemanthtm2/multi-client:$SHA -f ./client/Dockerfile ./client 

docker build -t hemanthtm2/multi-server:latest -t hemanthtm2/multi-server:$SHA ./server/Dockerfile ./server 

docker build -t hemanthtm2/multi-worker:latest -t hemanthtm2/multi-worker:$SHA  ./worker/Dockerfile ./worker

docker push hemanthtm2/multi-client:latest

docker push hemanthtm2/multi-server:latest

docker push  hemanthtm2/multi-worker:latest

docker push hemanthtm2/multi-client:$SHA

docker push hemanthtm2/multi-server:$SHA

docker push  hemanthtm2/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/server-deployment server=hemanthtm2/multi-server:$SHA

kubectl set image deployments/client-deployment client=hemanthtm2/multi-client:$SHA

kubectl set image deployments/worker-deployment worker=hemanthtm2/multi-worker:$SHA
