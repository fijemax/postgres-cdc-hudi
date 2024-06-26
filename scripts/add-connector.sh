curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" http://localhost:8083/connectors/ -d '{
  "name": "my-table-connector",
  "config": {
    "connector.class": "io.debezium.connector.postgresql.PostgresConnector",
    "tasks.max": "1",
    "database.hostname": "postgres",
    "database.port": "5432",
    "database.user": "user",
    "database.password": "password",
    "database.dbname": "db",
    "database.server.name": "dbserver1",
    "schema.include.list": "public",
    "table.include.list": "public.my_table",
    "plugin.name": "pgoutput",
    "snapshot.mode": "initial",
    "topic.prefix": "connect"
  }
}'