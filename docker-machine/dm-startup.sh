sudo apt-get update

sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian stretch stable"

sudo apt-get install docker-ce

# generate docker-machine service account
gcloud iam service-accounts create docker-sa

# grant full storage admin persmissions for docker push
gcloud projects add-iam-policy-binding $PROJECT_ID --member "serviceAccount:docker-sa@$PROJECT_ID.iam.gserviceaccount.com" --role "roles/storage.admin"

# generate the keep file
gcloud iam service-accounts keys create keyfile.json --iam-account docker-sa@$PROJECT_ID.iam.gserviceaccount.com

cat keyfile.json | sudo docker login -u _json_key --password-stdin https://gcr.io





