export SA_EMAIL=$(gcloud iam service-accounts list --filter="displayName:$BUCKET_SA" --format='value(email)')
echo $SA_EMAIL

sleep 5

gcloud projects add-iam-policy-binding $PROJECT_ID --member serviceAccount:$SA_EMAIL --role roles/storage.admin

gcloud iam service-accounts keys create sarc-bucket-sa.json --iam-account $SA_EMAIL

cp sarc-bucket-sa.json ./containers/spark-master
cp sarc-bucket-sa.json ./containers/spark-worker

kubectl create secret generic sarc-bucket-sa --from-file=sarc-bucket-sa.json -n spark
