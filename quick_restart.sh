sh spark-on-gke/create-gke-cluster.sh

kubectl create -f spark-on-gke/spark-rbac.yaml

sh spark-on-gke/authenticate-gcs.sh

sh spark-on-gke/start-driver-pod.sh
