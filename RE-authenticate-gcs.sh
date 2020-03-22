# Delete latest existing secret (we only have a limited number)
export SA_EMAIL=$(gcloud iam service-accounts list --filter="displayName:$BUCKET_SA" --format='value(email)')
export TO_DELETE=$(gcloud iam service-accounts keys list --iam-account $SA_EMAIL --managed-by user --limit 1 --format='value(KEY_ID)')
gcloud iam service-accounts keys delete $TO_DELETE --iam-account=$SA_EMAIL --quiet

# create secret for remote access as service account, download secret locally
export SA_EMAIL=$(gcloud iam service-accounts list --filter="displayName:$BUCKET_SA" --format='value(email)')
gcloud iam service-accounts keys create sarc-bucket-sa.json --iam-account $SA_EMAIL

# copying to dockerfile staging areas
cp sarc-bucket-sa.json ./containers/spark-master
cp sarc-bucket-sa.json ./containers/spark-worker
