#!/bin/bash
set -e

echo "Waiting for MySQL..."
until mysql -h metastore-db -u hive -phivepw -e "SELECT 1;" >/dev/null 2>&1; do
  echo "MySQL not ready. Waiting..."
  sleep 5
done
echo "MySQL is ready."

echo "Checking if Hive metastore schema exists..."
if ! mysql -h metastore-db -u hive -phivepw -D hive_metastore -e "SHOW TABLES LIKE 'ctlgs';" | grep ctlgs >/dev/null; then
  echo "Schema not found. Initializing Hive metastore schema..."
  /opt/hive/bin/schematool -dbType mysql -initSchema
else
  echo "Schema already exists. Skipping initialization."
fi

echo "Starting Hive Metastore..."
exec /opt/hive/bin/hive --service metastore
