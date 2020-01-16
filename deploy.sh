docker build -t etore/multi-client -f ./client/Dockerfile ./client
docker build -t etore/multi-server -f ./server/Dockerfile ./server
docker build -t etore/multi-worker -f ./worker/Dockerfile ./worker
docker push etore/multi-client
docker push etore/multi-server
docker push etore/multi-worker
kubectl apply -f k8s
kubectl rollout restart deployment server-deployment
kubectl rollout restart deployment client-deployment
kubectl rollout restart deployment worker-deployment