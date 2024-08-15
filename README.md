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

This will download the Hudi utilities and create the Kafka Source Connector.

```bash
./init.sh
```

3. **Start the ingestion**

```bash
./hudi-stream.sh
```

Sometimes the Postgres connector will fail to start, in that case, you can restart it with the following command:

```bash
docker compose restart connect
```

4. **Query the data**

```bash
docker compose exec trino trino
```

```sql
SELECT * FROM hudi.default.basic1;
SELECT * FROM hudi.default.basic2;
```

## Services

- [Control Center](http://localhost:9021)
- [Connect](http://localhost:8083)
- [Schema Registry](http://localhost:8081)
- [MinIO](http://localhost:9000)
- [pgAdmin](http://localhost:5050)
- [REST Proxy](http://localhost:8082)
- [Spark](http://localhost:4041)


## Warnings

- Apicurio seems to not work with Hudi (at this time), so we're forced to use the Confluent Schema Registry.