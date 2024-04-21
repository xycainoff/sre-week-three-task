#!/bin/env bash
NS="sre"
DEPL_NAME="swype-app"
MAX_RESTART=3
while true; do
    RESTARTS="$(kubectl get pods --namespace $NS --selector=app=$DEPL_NAME | awk '{print $4}' | tail -1)"
    echo "Pod in $DEPL_NAME deployment restarted $RESTARTS times"
    if [[ $RESTARTS > $MAX_RESTART ]]; then
        echo "Too many restarts, scaling down this deployment..."
        kubectl scale deployment --namespace $NS $DEPL_NAME --replicas=0
        break
    fi
    sleep 60
done
