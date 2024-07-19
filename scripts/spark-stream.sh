docker compose exec spark-master spark-submit \
--class org.apache.hudi.utilities.streamer.HoodieStreamer \
--packages org.apache.hudi:hudi-spark3.5-bundle_2.12:0.15.0,org.apache.hudi:hudi-utilities-slim-bundle_2.12:0.15.0 \
--properties-file hudi/spark-config.properties \
--master "local[*]" \
--executor-memory 1g \
hudi/hudi.jar \
--table-type COPY_ON_WRITE \
--target-base-path file:///usr/data/basic \
--target-table basic_table \
--source-class org.apache.hudi.utilities.sources.debezium.PostgresDebeziumSource \
--payload-class org.apache.hudi.common.model.debezium.PostgresDebeziumAvroPayload \
--op UPSERT \
--continuous \
--source-limit 4000000 \
--min-sync-interval-seconds 20 \
--hoodie-conf bootstrap.servers=kafka:29092 \
--hoodie-conf schema.registry.url=http://schema-registry:8081 \
--hoodie-conf hoodie.streamer.schemaprovider.registry.url=http://schema-registry:8081/subjects/cdc.public.basic-value/versions/latest \
--hoodie-conf hoodie.streamer.source.kafka.value.deserializer.class=io.confluent.kafka.serializers.KafkaAvroDeserializer \
--hoodie-conf hoodie.streamer.source.kafka.topic=cdc.public.basic \
--hoodie-conf auto.offset.reset=earliest \
--hoodie-conf hoodie.datasource.write.recordkey.field=id \
--hoodie-conf hoodie.datasource.write.partitionpath.field=name \
--hoodie-conf hoodie.datasource.write.keygenerator.class=org.apache.hudi.keygen.SimpleKeyGenerator
--hoodie-conf hoodie.datasource.write.hive_style_partitioning=true
--hoodie-conf hoodie.datasource.write.precombine.field=name
--source-ordering-field ts  \

# --properties-file config/spark-config.properties \
