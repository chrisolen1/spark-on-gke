gsutil mb -l $REGION -p $PROJECT_NAME gs://${BUCKET_NAME}/ 

sleep 5

gcloud iam service-accounts create $BUCKET_SA --display-name $BUCKET_SA

sleep 5

