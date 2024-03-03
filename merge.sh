#!/usr/bin/env bash

yml_files=("./declarative/_/namespace.yml"
"./declarative/config/env.yml"
"./declarative/deployments/apps/influxdb.yml"
"./declarative/deployments/apps/mariadb.yml"
"./declarative/deployments/apps/redis.yml"
"./declarative/deployments/apps/telegraf.yml"
"./declarative/deployments/core/appwrite.yml"
"./declarative/deployments/core/assistant.yml"
"./declarative/deployments/core/realtime.yml"
"./declarative/deployments/schedulers/maintenance.yml"
"./declarative/deployments/schedulers/schedule.yml"
"./declarative/deployments/schedulers/usage.yml"
"./declarative/deployments/workers/audits.yml"
"./declarative/deployments/workers/builds.yml"
"./declarative/deployments/workers/certificates.yml"
"./declarative/deployments/workers/databases.yml"
"./declarative/deployments/workers/deletes.yml"
"./declarative/deployments/workers/functions.yml"
"./declarative/deployments/workers/mails.yml"
"./declarative/deployments/workers/messaging.yml"
"./declarative/deployments/workers/migrations.yml"
"./declarative/deployments/workers/webhooks.yml"
"./declarative/hpa/appwrite.yml"
"./declarative/hpa/realtime.yml"
"./declarative/ingress/core.yml"
"./declarative/ingress/realtime.yml"
"./declarative/secrets/env_secrets.yaml"
"./declarative/services/appwrite.yaml"
"./declarative/services/influxdb.yaml"
"./declarative/services/mariadb.yaml"
"./declarative/services/realtime.yaml"
"./declarative/services/redis.yaml"
"./declarative/services/telegraf.yaml"
"./declarative/volumes/builds.yml"
"./declarative/volumes/cache.yml"
"./declarative/volumes/cerificates.yml"
"./declarative/volumes/config.yml"
"./declarative/volumes/functions.yml"
"./declarative/volumes/influxdb.yml"
"./declarative/volumes/mariadb.yml"
"./declarative/volumes/redis.yml"
"./declarative/volumes/uploads.yml")

echo '' > imperative/appwrite.yml

for file in ${yml_files[@]}; do
  printf '\n---\n' >> imperative/appwrite.yml
  cat $file >> imperative/appwrite.yml
done
