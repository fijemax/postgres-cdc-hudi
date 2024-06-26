from pyspark.sql import SparkSession
from pyspark.sql.functions import from_json, col
from pyspark.sql.types import StructType, StructField, StringType, IntegerType

# Create Spark session
spark = SparkSession.builder.appName("PostgresToDelta").getOrCreate()

df = (
    spark.readStream.format("kafka")
    .option("kafka.bootstrap.servers", "localhost:9092")
    .option("subscribe", "my_table_.public.my_table")
    .option("startingOffsets", "earliest")
    .load()
)

data_schema = StructType(
    [
        StructField("id", IntegerType(), False),
        StructField("value", IntegerType(), False),
        StructField("value2", StringType(), True),
    ]
)

schema = StructType(
    [
        StructField(
            "payload",
            StructType(
                [
                    StructField("before", StructType(data_schema)),
                    StructField("after", StructType(data_schema)),
                    StructField("ts_ms", StringType()),
                    StructField("op", StringType()),
                ]
            ),
        )
    ]
)
parsed_df = df.select(
    from_json(col("value").cast("string"), schema).alias("data")
).select("data.*")

query = (
    parsed_df.writeStream.format("delta")
    .outputMode("append")
    .option("checkpointLocation", "/path/to/checkpoint/dir")
    .start("/path/to/delta/table")
)


# Define checkpoint location
checkpoint_dir = "s3a://change-data-capture/checkpoint"


# Define MinIO (S3) output path
minio_output_path = "s3a://change-data-capture/"