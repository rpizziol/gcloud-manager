#!/bin/bash

source environment.sh

# Generate Kubernetes cluster
echo "[Creating the Google Cloud cluster \"$CLUSTER_NAME\" in zone \"$ZONE_NAME\", comprising $NUM_NODES \"$CLUSTER_MACHINE_TYPE\" nodes with Alpha features.]"
#gcloud container clusters create "$CLUSTER_NAME" --zone="$ZONE_NAME" --machine-type="$CLUSTER_MACHINE_TYPE" --num-nodes="$NUM_NODES

gcloud beta container --project "my-microservice-test-project" clusters create "$CLUSTER_NAME" --zone "$ZONE_NAME" \
--enable-kubernetes-alpha --no-enable-autorepair --no-enable-autoupgrade \
--no-enable-basic-auth --cluster-version "1.30.3-gke.1639000" --release-channel "regular" --machine-type "$CLUSTER_MACHINE_TYPE" --image-type "COS_CONTAINERD" \
 --disk-type "pd-balanced" --disk-size "100" --metadata disable-legacy-endpoints=true --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" \
 --max-pods-per-node "110" --num-nodes "$NUM_NODES" --logging=SYSTEM,WORKLOAD --monitoring=SYSTEM,STORAGE,POD,DEPLOYMENT,STATEFULSET,DAEMONSET,HPA,CADVISOR,KUBELET \
 --enable-ip-alias --network "projects/my-microservice-test-project/global/networks/default" --subnetwork "projects/my-microservice-test-project/regions/northamerica-northeast1/subnetworks/default" \
 --no-enable-intra-node-visibility --default-max-pods-per-node "110" --security-posture=standard --workload-vulnerability-scanning=disabled --no-enable-master-authorized-networks \
 --addons HorizontalPodAutoscaling,HttpLoadBalancing,GcePersistentDiskCsiDriver --max-surge-upgrade 1 --max-unavailable-upgrade 0 \
 --binauthz-evaluation-mode=DISABLED --enable-managed-prometheus --enable-shielded-nodes --node-locations "$ZONE_NAME"



# gcloud beta container --project "my-microservice-test-project" clusters create "$CLUSTER_NAME" \
#       --cluster-version "1.28.8-gke.1095000" \
#       --enable-kubernetes-alpha --no-enable-autorepair --no-enable-autoupgrade \
#       --no-enable-basic-auth --release-channel "regular" --machine-type "$CLUSTER_MACHINE_TYPE" \
#       --image-type "COS_CONTAINERD" --disk-type "pd-balanced" --disk-size "100" --metadata disable-legacy-endpoints=true\
#        --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" \
#        --num-nodes "$NUM_NODES" --logging=SYSTEM,WORKLOAD --monitoring=SYSTEM --enable-ip-alias --network "projects/my-microservice-test-project/global/networks/default" --subnetwork "projects/my-microservice-test-project/regions/northamerica-northeast1/subnetworks/default" --no-enable-intra-node-visibility --default-max-pods-per-node "110" --security-posture=standard --workload-vulnerability-scanning=disabled --no-enable-master-authorized-networks --addons HorizontalPodAutoscaling,HttpLoadBalancing,GcePersistentDiskCsiDriver --max-surge-upgrade 1 --max-unavailable-upgrade 0 --binauthz-evaluation-mode=DISABLED --enable-managed-prometheus --enable-vertical-pod-autoscaling --enable-shielded-nodes \
#        --node-locations "$ZONE_NAME"




 # gcloud beta container --project "my-microservice-test-project" clusters create "cluster-2" --zone "northamerica-northeast1-a" --no-enable-basic-auth --cluster-version "1.30.3-gke.1639000" --release-channel "None" --machine-type "c2-standard-30" --image-type "COS_CONTAINERD" --disk-type "pd-balanced" --disk-size "100" --metadata disable-legacy-endpoints=true --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --enable-kubernetes-alpha --num-nodes "3" --logging=SYSTEM,WORKLOAD --monitoring=SYSTEM,STORAGE,POD,DEPLOYMENT,STATEFULSET,DAEMONSET,HPA,CADVISOR,KUBELET --enable-ip-alias --network "projects/my-microservice-test-project/global/networks/default" --subnetwork "projects/my-microservice-test-project/regions/northamerica-northeast1/subnetworks/default" --no-enable-intra-node-visibility --default-max-pods-per-node "110" --security-posture=standard --workload-vulnerability-scanning=disabled --no-enable-master-authorized-networks --addons HorizontalPodAutoscaling,HttpLoadBalancing,GcePersistentDiskCsiDriver --no-enable-autoupgrade --no-enable-autorepair --max-surge-upgrade 1 --max-unavailable-upgrade 0 --binauthz-evaluation-mode=DISABLED --enable-managed-prometheus --enable-shielded-nodes --node-locations "northamerica-northeast1-a"

# Notify end of operation
echo "[Creation of cluster \"$CLUSTER_NAME\" completed.]"
aplay /usr/share/sounds/sound-icons/piano-3.wav &> /dev/null