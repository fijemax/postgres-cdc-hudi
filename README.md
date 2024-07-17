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

## Services

- [Control Center](http://localhost:9021)
- [Connect](http://localhost:8083)
- [Schema Registry](http://localhost:8081)
- [MinIO](http://localhost:9000)
- [pgAdmin](http://localhost:5050)
- [REST Proxy](http://localhost:8082)
- [Spark](http://localhost:4041)
