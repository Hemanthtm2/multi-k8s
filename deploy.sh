docker build -t hemanth/multi-client:latest -t hemanth/multi-client:$SHA -f ./client/Dockerfile ./client 

docker build -t hemanth/multi-server:latest -t hemanth/multi-server:$SHA -f ./server/Dockerfile ./server 

docker build -t hemanth/multi-worker:latest -t hemanth/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push hemanth/multi-client:latest

docker push hemanth/multi-server:latest

docker push  hemanth/multi-worker:latest

docker push hemanth/multi-client:$SHA

docker push hemanth/multi-server:$SHA

docker push  hemanth/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/server-deployment server=hemanth/multi-server:$SHA

kubectl set image deployments/client-deployment client=hemanth/multi-client:$SHA

kubectl set image deployments/worker-deployment worker=hemanth/multi-worker:$SHA
