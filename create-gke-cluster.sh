gcloud container clusters create $CLUSTER_NAME --machine-type $MASTER_MCHN_TYPE \
--zone $ZONE --num-nodes $NUM_NODES --max-nodes $MAX_AUTOSCALE_NODES --enable-autoscaling --addons HorizontalPodAutoscaling
