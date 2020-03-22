gcloud compute instances create docker-machine \
        --zone=$ZONE \
	--image-project debian-cloud \
        --image-family=debian-9 \
        --machine-type=n1-standard-4 \
        --boot-disk-size=50GB \
	--service-account docker-sa@$PROJECT_ID.iam.gserviceaccount.com 
