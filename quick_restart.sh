sh create-gke-cluster.sh

kubectl create -f spark-rbac.yaml

sh authenticate-gcs.sh

sh start-driver-pod.sh
