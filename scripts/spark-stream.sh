docker compose exec spark spark-submit \
--class org.apache.hudi.utilities.streamer.HoodieStreamer \
--packages org.apache.hudi:hudi-spark3.5-bundle_2.12:0.15.0,org.apache.hudi:hudi-utilities-slim-bundle_2.12:0.15.0 \
--properties-file hudi/spark-config.properties \
--master "local[*]" \
--executor-memory 1g \
hudi/hudi.jar \
--table-type COPY_ON_WRITE \
--target-base-path s3a://hudi/basic \
--target-table basic_table \
--source-class org.apache.hudi.utilities.sources.debezium.PostgresDebeziumSource \
--payload-class org.apache.hudi.common.model.debezium.PostgresDebeziumAvroPayload \
--op UPSERT \
--continuous \
--source-limit 4000000 \
--min-sync-interval-seconds 20 \
--source-ordering-field timestamp  \
--props hudi/hudi.properties