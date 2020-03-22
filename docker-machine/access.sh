# generate docker-machine service account
gcloud iam service-accounts create docker-sa --display-name docker-sa

# grant full storage admin persmissions for docker push
gcloud projects add-iam-policy-binding $PROJECT_ID --member "serviceAccount:docker-sa@$PROJECT_ID.iam.gserviceaccount.com" --role "roles/editor"

# Delete latest existing secret (we only have a limited number)
export SA_EMAIL=$(gcloud iam service-accounts list --filter="displayName:docker-sa" --format='value(email)')
export TO_DELETE=$(gcloud iam service-accounts keys list --iam-account $SA_EMAIL --managed-by user --limit 1 --format='value(KEY_ID)')
gcloud iam service-accounts keys delete $TO_DELETE --iam-account=$SA_EMAIL --quiet

# generate the key file
gcloud iam service-accounts keys create keyfile.json --iam-account docker-sa@$PROJECT_ID.iam.gserviceaccount.com
