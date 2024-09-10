#!/bin/bash

docker compose exec spark spark-submit \
--class org.apache.hudi.utilities.streamer.HoodieMultiTableStreamer \
--packages org.apache.hudi:hudi-spark3.5-bundle_2.12:0.15.0 \
--properties-file hudi/spark-config.properties \
--master "local[*]" \
--executor-memory 1g \
hudi/hudi.jar \
--table-type COPY_ON_WRITE \
--base-path-prefix s3a://hudi \
--config-folder file:///opt/bitnami/spark/hudi/conf \
--source-class org.apache.hudi.utilities.sources.debezium.PostgresDebeziumSource \
--payload-class org.apache.hudi.common.model.debezium.PostgresDebeziumAvroPayload \
--op UPSERT \
--source-limit 4000000 \
--min-sync-interval-seconds 10 \
--source-ordering-field timestamp \
--enable-hive-sync \
--enable-sync \
--props hudi/conf/hudi-multistream.properties
