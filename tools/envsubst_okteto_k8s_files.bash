#!/usr/bin/env bash
for file in k8s/kkweon-okteto/*.yaml
do
  envsubst < "$file" | kubectl apply -f -
done
