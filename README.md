# spark-on-gke
Spins up a customizable Spark cluster on Google Kubernetes Engine, with connection to Google Cloud Storage.

Assumes you have GCloud SDK, Kubectl, and Docker configured on your device already. 

1. Set environmental variables (configure for your own purposes first) 
```bash
source vars.rc
```

2. Create GCP Project
```bash
sh gcloud-create-project.sh
```

3. Enable relevant APIs for project
```bash
sh enable_apis.sh
```

4. Spin up GKE cluster
```bash
gcloud-create-kub-cluster.sh
```

5. Configure RBAC for GKE cluster
```bash
kubectl create -f spark-rbac.yaml
```

6. Create GCS bucket, create secret for bucket access, and provide access to GKE cluster
```bash
sh create-gcs.sh
```

7. Create and push docker Spark/Hadoop/Python images from Dockerfiles included in repo (uses Spark v2.4.4, Hadoop v2.7, Python v3.7)
```bash
sh docker-build-push.sh
```

8. Start Spark driver pod in current shell
```bash
sh start-driver-pod.sh
```

9. (In another shell) Expose driver service for access via Jupyter notebook
```bash
sh expose-driver.sh
```






