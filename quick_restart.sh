sh create-gke-cluster.sh

kubectl create -f spark-rbac.yaml

sh secret-to-kub.sh

sh start-driver-pod.sh
