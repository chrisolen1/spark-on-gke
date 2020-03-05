kubectl run $DRIVER_NAME --rm=true -ti -n $SPARK_NAMESPACE --image=$DRIVER_IMAGE --serviceaccount=$DRIVER_POD_SA \
--requests=cpu=2,memory=2G
	
