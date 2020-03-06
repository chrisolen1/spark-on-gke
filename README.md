# spark-on-gke
Spins up a customizable Spark cluster on Google Kubernetes Engine, with connection to Google Cloud Storage.

Assumes you have GCloud SDK, Kubectl, and Docker configured on your device already. 

## Initial setup

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

4. Create GCS bucket and a service account which has admin access to the bucket and provide access to GKE cluster (Note: This just be run prior to building/pushing Docker images because this step will distribute the GCS secret json file to all of the relevant images)
```bash
sh create-gcs.sh
```

5. Create a secret for remote access as service account, download locally, and distribute to Dockerfile staging areas
```bash
sh authenticate-gcs.sh
```

6. Create and push docker Spark/Hadoop/Python images from Dockerfiles included in repo (uses Spark v2.4.4, Hadoop v2.7, Python v3.7)
```bash
sh docker-build-push.sh
```

7. Spin up GKE cluster
```bash
sh create-gke-cluster.sh
```

8. Configure RBAC for GKE cluster
```bash
kubectl create -f spark-rbac.yaml
```

9. Add GCS service account secret to Kubernetes namespace 
```bash
sh secret-to-kub.sh
```

10. Start Spark driver pod in current shell
```bash
sh start-driver-pod.sh
```

10. (In another shell) Expose driver service for access via Jupyter notebook. Scripts for starting Jupyter are included in Spark driver image
```bash
sh expose-driver.sh
```

## Spinning down resources

1. Delete all kubernetes pods and services
```bash
sh shutdown-pods-services.sh
```

2. Delete cluster
```bash
sh delete-gke-cluster.sh
```

## Spinning resources back up

1. This will re-create cluster, kubernetes RBAC setting, transfer secret to Kubernetes space, and start the driver pod











