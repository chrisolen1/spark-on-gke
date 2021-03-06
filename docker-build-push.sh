#gcloud auth configure-docker -q

cd containers/spark-master
echo $PWD
sudo docker build -t ${DRIVER_IMAGE} .
echo "Successfully Built Driver Image"
sudo docker push ${DRIVER_IMAGE}
echo "Successfully Pushed Driver Image"
cd ../spark-worker
echo $PWD
sudo docker build -t ${WORKER_IMAGE} -f kubernetes/dockerfiles/spark/Dockerfile .
echo "Successfully Built Worker Image"
sudo docker push ${WORKER_IMAGE}
echo "Successfully Pushed Worker Image"
