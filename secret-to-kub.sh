# add secret to kubernetes namespace
kubectl create secret generic sarc-bucket-sa --from-file=sarc-bucket-sa.json -n spark
