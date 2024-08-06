FROM quay.io/debezium/connect:2.7.0.Final

ARG JAR_VERSION=7.6.2

ENV CONFLUENT_REPO=https://packages.confluent.io/maven/io/confluent
ENV MAVEN_REPO=https://repo1.maven.org/maven2
# Create a directory for the JARs
RUN mkdir -p "$KAFKA_CONNECT_PLUGINS_DIR/confluent_jars"

# Download Confluent Avro converter and dependencies
# https://debezium.io/documentation/reference/stable/configuration/avro.html#deploying-confluent-schema-registry-with-debezium-containers
RUN \
	curl -O --output-dir ${KAFKA_CONNECT_PLUGINS_DIR}/confluent_jars ${CONFLUENT_REPO}/kafka-connect-avro-converter/${JAR_VERSION}/kafka-connect-avro-converter-${JAR_VERSION}.jar && \
	curl -O --output-dir ${KAFKA_CONNECT_PLUGINS_DIR}/confluent_jars ${CONFLUENT_REPO}/kafka-connect-avro-data/${JAR_VERSION}/kafka-connect-avro-data-${JAR_VERSION}.jar && \
	curl -O --output-dir ${KAFKA_CONNECT_PLUGINS_DIR}/confluent_jars ${CONFLUENT_REPO}/kafka-avro-serializer/${JAR_VERSION}/kafka-avro-serializer-${JAR_VERSION}.jar && \
	curl -O --output-dir ${KAFKA_CONNECT_PLUGINS_DIR}/confluent_jars ${CONFLUENT_REPO}/kafka-schema-serializer/${JAR_VERSION}/kafka-schema-serializer-${JAR_VERSION}.jar && \
	curl -O --output-dir ${KAFKA_CONNECT_PLUGINS_DIR}/confluent_jars ${CONFLUENT_REPO}/kafka-schema-converter/${JAR_VERSION}/kafka-schema-converter-${JAR_VERSION}.jar && \
	curl -O --output-dir ${KAFKA_CONNECT_PLUGINS_DIR}/confluent_jars ${CONFLUENT_REPO}/kafka-schema-registry-client/${JAR_VERSION}/kafka-schema-registry-client-${JAR_VERSION}.jar && \
	curl -O --output-dir ${KAFKA_CONNECT_PLUGINS_DIR}/confluent_jars ${CONFLUENT_REPO}/common-config/${JAR_VERSION}/common-config-${JAR_VERSION}.jar && \
	curl -O --output-dir ${KAFKA_CONNECT_PLUGINS_DIR}/confluent_jars ${CONFLUENT_REPO}/common-utils/${JAR_VERSION}/common-utils-${JAR_VERSION}.jar

# Download additional required JARs
ARG AVRO_VERSION=1.11.3
ARG COMMONS_COMPRESS_VERSION=1.26.2
ARG FAILUREACCESS_VERSION=1.0.2
ARG GUAVA_VERSION=30.1-jre
ARG MINIMAL_JSON_VERSION=0.9.5
ARG RE2J_VERSION=1.6
ARG SLF4J_API_VERSION=1.7.32
ARG SNAKEYAML_VERSION=1.29
ARG SWAGGER_ANNOTATIONS_VERSION=1.6.2
ARG JACKSON_DATABIND_VERSION=2.13.0
ARG JACKSON_CORE_VERSION=2.13.0
ARG JACKSON_ANNOTATIONS_VERSION=2.13.0
ARG JACKSON_DATAFORMAT_CSV_VERSION=2.13.0
ARG LOGREDACTOR_VERSION=1.0.9
ARG LOGREDACTOR_METRICS_VERSION=1.0.9

RUN \
	curl -O --output-dir ${KAFKA_CONNECT_PLUGINS_DIR}/confluent_jars ${MAVEN_REPO}/org/apache/avro/avro/${AVRO_VERSION}/avro-${AVRO_VERSION}.jar && \
	curl -O --output-dir ${KAFKA_CONNECT_PLUGINS_DIR}/confluent_jars ${MAVEN_REPO}/org/apache/commons/commons-compress/${COMMONS_COMPRESS_VERSION}/commons-compress-${COMMONS_COMPRESS_VERSION}.jar && \
	curl -O --output-dir ${KAFKA_CONNECT_PLUGINS_DIR}/confluent_jars ${MAVEN_REPO}/com/google/guava/failureaccess/${FAILUREACCESS_VERSION}/failureaccess-${FAILUREACCESS_VERSION}.jar && \
	curl -O --output-dir ${KAFKA_CONNECT_PLUGINS_DIR}/confluent_jars ${MAVEN_REPO}/com/google/guava/guava/${GUAVA_VERSION}/guava-${GUAVA_VERSION}.jar && \
	curl -O --output-dir ${KAFKA_CONNECT_PLUGINS_DIR}/confluent_jars ${MAVEN_REPO}/com/eclipsesource/minimal-json/minimal-json/${MINIMAL_JSON_VERSION}/minimal-json-${MINIMAL_JSON_VERSION}.jar && \
	curl -O --output-dir ${KAFKA_CONNECT_PLUGINS_DIR}/confluent_jars ${MAVEN_REPO}/com/google/re2j/re2j/${RE2J_VERSION}/re2j-${RE2J_VERSION}.jar && \
	curl -O --output-dir ${KAFKA_CONNECT_PLUGINS_DIR}/confluent_jars ${MAVEN_REPO}/org/slf4j/slf4j-api/${SLF4J_API_VERSION}/slf4j-api-${SLF4J_API_VERSION}.jar && \
	curl -O --output-dir ${KAFKA_CONNECT_PLUGINS_DIR}/confluent_jars ${MAVEN_REPO}/org/yaml/snakeyaml/${SNAKEYAML_VERSION}/snakeyaml-${SNAKEYAML_VERSION}.jar && \
	curl -O --output-dir ${KAFKA_CONNECT_PLUGINS_DIR}/confluent_jars ${MAVEN_REPO}/io/swagger/swagger-annotations/${SWAGGER_ANNOTATIONS_VERSION}/swagger-annotations-${SWAGGER_ANNOTATIONS_VERSION}.jar && \
	curl -O --output-dir ${KAFKA_CONNECT_PLUGINS_DIR}/confluent_jars ${MAVEN_REPO}/com/fasterxml/jackson/core/jackson-databind/${JACKSON_DATABIND_VERSION}/jackson-databind-${JACKSON_DATABIND_VERSION}.jar && \
	curl -O --output-dir ${KAFKA_CONNECT_PLUGINS_DIR}/confluent_jars ${MAVEN_REPO}/com/fasterxml/jackson/core/jackson-core/${JACKSON_CORE_VERSION}/jackson-core-${JACKSON_CORE_VERSION}.jar && \
	curl -O --output-dir ${KAFKA_CONNECT_PLUGINS_DIR}/confluent_jars ${MAVEN_REPO}/com/fasterxml/jackson/core/jackson-annotations/${JACKSON_ANNOTATIONS_VERSION}/jackson-annotations-${JACKSON_ANNOTATIONS_VERSION}.jar && \
	curl -O --output-dir ${KAFKA_CONNECT_PLUGINS_DIR}/confluent_jars ${MAVEN_REPO}/com/fasterxml/jackson/dataformat/jackson-dataformat-csv/${JACKSON_DATAFORMAT_CSV_VERSION}/jackson-dataformat-csv-${JACKSON_DATAFORMAT_CSV_VERSION}.jar && \
	curl -O --output-dir ${KAFKA_CONNECT_PLUGINS_DIR}/confluent_jars ${MAVEN_REPO}/io/confluent/logredactor/${LOGREDACTOR_VERSION}/logredactor-${LOGREDACTOR_VERSION}.jar && \
	curl -O --output-dir ${KAFKA_CONNECT_PLUGINS_DIR}/confluent_jars ${MAVEN_REPO}/io/confluent/logredactor-metrics/${LOGREDACTOR_METRICS_VERSION}/logredactor-metrics-${LOGREDACTOR_METRICS_VERSION}.jar
