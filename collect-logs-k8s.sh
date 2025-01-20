#!/bin/bash

# Deployment and namespace details
DEPLOYMENT_NAME="your-deployment-name"
NAMESPACE="your-namespace"

# Duration to collect logs (in seconds)
DURATION=600 # 10 minutes

# Output directory for logs
OUTPUT_DIR="k8s-deployment-logs-$(date +%Y%m%d%H%M%S)"
mkdir -p $OUTPUT_DIR

# Get pod names for the deployment
PODS=$(kubectl get pods -n $NAMESPACE -l app=$DEPLOYMENT_NAME -o jsonpath="{.items[*].metadata.name}")

if [ -z "$PODS" ]; then
  echo "No pods found for deployment: $DEPLOYMENT_NAME in namespace: $NAMESPACE"
  exit 1
fi

echo "Collecting logs from deployment: $DEPLOYMENT_NAME in namespace: $NAMESPACE for $DURATION seconds..."

# Function to stream logs from all pods
stream_logs() {
  for POD in $PODS; do
    echo "Streaming logs from pod: $POD"
    # Stream logs for the pod and save to file
    kubectl logs -n $NAMESPACE $POD --follow > "$OUTPUT_DIR/${POD}.log" 2>&1 &
  done
}

# Start streaming logs
stream_logs

# Wait for the specified duration (10 minutes)
sleep $DURATION

# Kill all background log streaming processes
echo "Stopping log collection..."
pkill -P $$

echo "Logs collected in directory: $OUTPUT_DIR"
