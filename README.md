# CDC playground

# This is a playground for the CDC project. 
The goal is to create a simple application that can be used to bootstrap CDC (Change Data Capture) projects.

## Getting started

To get started, follow these steps:

1. **Start all the services**

```bash
docker compose up -d
```

2. **Initialize the environment**

This will load the necessary data into the database and create the Kafka Source Connector.

```bash
./init.sh
```

Create a `hudi` bucket in MinIO

```bash
docker compose exec minio mc mb data/hudi
```

Create an access key and secret key for the bucket

```bash
docker compose exec minio mc admin user add data/hudi hudi hudi
```

3. **Start the ingestion**

```bash
./scripts/spark-stream.sh
```

4. **Query the data**

```bash
docker compose exec spark-master spark-shell --packages org.apache.hudi:hudi-spark3.5-bundle_2.12:0.15.0 --properties-file hudi/spark-config.properties
```

```scala
val basicDF = spark.read.format("hudi").load("s3a://hudi/basic")
basicDF.show()
```

## Services

- [Control Center](http://localhost:9021)
- [Connect](http://localhost:8083)
- [Schema Registry](http://localhost:8081)
- [MinIO](http://localhost:9000)
- [pgAdmin](http://localhost:5050)
- [REST Proxy](http://localhost:8082)
- [Spark](http://localhost:4041)

## Query Hudi



## Warnings

- Apicurio seems to not work with Hudi (at this time), so we're forced to use the Confluent Schema Registry.