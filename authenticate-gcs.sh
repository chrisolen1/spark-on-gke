# create secret for remote access as service account, download secret locally
export SA_EMAIL=$(gcloud iam service-accounts list --filter="displayName:$BUCKET_SA" --format='value(email)')
gcloud iam service-accounts keys create sarc-bucket-sa.json --iam-account $SA_EMAIL

# copying to dockerfile staging areas
cp sarc-bucket-sa.json ./containers/spark-master
cp sarc-bucket-sa.json ./containers/spark-worker
