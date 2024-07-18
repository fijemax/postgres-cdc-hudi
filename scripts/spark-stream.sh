SPARK_VERSION=3.5
spark-submit \
--class org.apache.hudi.utilities.streamer.HoodieStreamer \
--packages org.apache.hudi:hudi-spark$SPARK_VERSION-bundle_2.12:0.15.0 \
--master "local[*]" \
--executor-memory 1g \
--properties-file hudi/spark-config.properties \
hudi/hudi.jar \
--table-type COPY_ON_WRITE \
--target-base-path file:///data/basic \
--target-table basic_table \
--source-class org.apache.hudi.utilities.sources.debezium.PostgresDebeziumSource \
--payload-class org.apache.hudi.common.model.debezium.PostgresDebeziumAvroPayload \
--source-ordering-field ts  \
--op UPSERT \
--continuous \
--source-limit 4000000 \
--min-sync-interval-seconds 20 \
--hoodie-conf bootstrap.servers=kafka:29092 \
--hoodie-conf schema.registry.url=http://apicurio:8080/apis/ccompat/v7 \
--hoodie-conf hoodie.streamer.schemaprovider.registry.url=http://apicurio:8080/apis/ccompat/v7/subjects/cdc.public.basic-value/versions/latest \
--hoodie-conf hoodie.streamer.source.kafka.value.deserializer.class=io.confluent.kafka.serializers.KafkaAvroDeserializer \
--hoodie-conf hoodie.streamer.source.kafka.topic=cdc.public.basic \
--hoodie-conf auto.offset.reset=earliest \
--hoodie-conf hoodie.datasource.write.recordkey.field=id \
--hoodie-conf hoodie.datasource.write.partitionpath.field=name \
--hoodie-conf hoodie.datasource.write.keygenerator.class=org.apache.hudi.keygen.SimpleKeyGenerator \
--hoodie-conf hoodie.datasource.write.hive_style_partitioning=true \
--hoodie-conf hoodie.datasource.write.precombine.field=name

# --properties-file config/spark-config.properties \
