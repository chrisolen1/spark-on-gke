kubectl delete --all deployment --namespace=$SPARK_NAMESPACE

kubectl delete --all services --namespace=$SPARK_NAMESPACE

kubectl delete --all pods --namespace=$SPARK_NAMESPACE
