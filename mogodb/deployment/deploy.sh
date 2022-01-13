#!/usr/bin/env bash

VERSION=$SERVICE-$BUILD_NUMBER
IMAGE=$SERVICE:$TAG

sed "s#{{service}}#$SERVICE#g; s#{{image}}#$IMAGE#g; s#{{namespace}}#$NAMESPACE#g; s#{{version}}#$VERSION#g" ./deployment/mongodb-configmap.yaml 

sed "s#{{service}}#$SERVICE#g; s#{{image}}#$IMAGE#g; s#{{namespace}}#$NAMESPACE#g; s#{{version}}#$VERSION#g" ./deployment/mongodb-deployment.yaml 

sed "s#{{service}}#$SERVICE#g; s#{{image}}#$IMAGE#g; s#{{namespace}}#$NAMESPACE#g; s#{{version}}#$VERSION#g" ./deployment/mongodb-secret.yaml 

sed "s#{{service}}#$SERVICE#g; s#{{image}}#$IMAGE#g; s#{{namespace}}#$NAMESPACE#g; s#{{version}}#$VERSION#g" ./deployment/mongodb-configmap.yaml | kubectl apply -f -

sed "s#{{service}}#$SERVICE#g; s#{{image}}#$IMAGE#g; s#{{namespace}}#$NAMESPACE#g; s#{{version}}#$VERSION#g" ./deployment/mongodb-deployment.yaml | kubectl apply -f -

sed "s#{{service}}#$SERVICE#g; s#{{image}}#$IMAGE#g; s#{{namespace}}#$NAMESPACE#g; s#{{version}}#$VERSION#g" ./deployment/mongodb-secret.yaml | kubectl apply -f -

kubectl rollout restart deployment.apps/$SERVICE