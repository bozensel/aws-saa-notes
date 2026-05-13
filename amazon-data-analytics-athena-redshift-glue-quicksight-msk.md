# AWS Data & Analytics Services Overview

# Amazon Athena

Amazon Athena is a serverless query service that allows users to analyze data directly from Amazon S3 using standard SQL.

## Key Features

* Built on the Presto query engine.
* Supports multiple file formats including CSV, JSON, ORC, Avro, and Parquet.
* Charges are based on the amount of data scanned, typically priced per terabyte.
* Frequently integrated with Amazon QuickSight for dashboards and reporting.
* Query results are stored back in Amazon S3.

## Common Use Cases

* Business intelligence and reporting
* Querying VPC Flow Logs
* Analyzing ELB access logs
* Reviewing AWS CloudTrail logs
* Serverless analytics on data stored in S3

## Exam Tip

When you need to run SQL queries directly against data stored in Amazon S3 without managing infrastructure, Amazon Athena is usually the best choice.

---

# Amazon Athena Performance Optimization

Several best practices can significantly improve Athena query performance and reduce cost.

## Recommended Optimizations

### Use Columnar File Formats

* Apache Parquet and ORC are highly recommended.
* Columnar storage reduces the amount of data scanned.
* Results in lower costs and faster query execution.

### Convert Data Using AWS Glue

* AWS Glue can transform datasets into optimized formats such as Parquet or ORC.

### Compress Data

* Compression reduces storage and retrieval overhead.
* Common compression formats include:

  * gzip
  * bzip2
  * lz4
  * snappy
  * zstd

### Partition Data in Amazon S3

Partitioning improves query efficiency by limiting the amount of scanned data.

### Example S3 Partition Structure

```text
s3://your-bucket/table-name/year=2025/month=01/day=01/
```

### Use Larger File Sizes

* Files larger than 128 MB are recommended.
* Larger files reduce overhead and improve processing efficiency.

---

# Amazon Athena Federated Query

Athena Federated Query enables SQL queries across multiple data sources beyond Amazon S3.

## Key Features

* Query relational, non-relational, object-based, and custom data sources.
* Supports both AWS-hosted and on-premises systems.
* Uses AWS Lambda-powered data source connectors.

## Supported Data Sources

* Amazon RDS
* Amazon DynamoDB
* Amazon CloudWatch Logs
* Custom data platforms

## Workflow

* Athena sends queries through Lambda connectors.
* Results are returned and stored in Amazon S3.

---

# Amazon Redshift Overview

Amazon Redshift is a fully managed cloud data warehouse service designed for online analytical processing (OLAP).

## Key Features

* Based on PostgreSQL architecture.
* Optimized for analytics and data warehousing rather than transactional workloads.
* Uses columnar storage for improved analytics performance.
* Includes a massively parallel processing (MPP) query engine.
* Available in both provisioned and serverless deployment modes.
* Supports SQL queries and integrates with BI tools.

## Integrations

* Amazon QuickSight
* Tableau
* Other analytics platforms

## Redshift vs Athena

Compared to Athena, Redshift generally provides:

* Faster query execution
* Better aggregation performance
* Improved joins and indexing capabilities

---

# Amazon Redshift Cluster Architecture

A Redshift cluster is composed of multiple node types.

## Leader Node

* Handles query planning.
* Aggregates query results.
* Coordinates communication between compute nodes.

## Compute Nodes

* Execute queries in parallel.
* Return processed results to the leader node.

## Provisioned Cluster Mode

* Requires selecting instance types in advance.
* Reserved instances can reduce long-term costs.

---

# Amazon Redshift Snapshots and Disaster Recovery

Amazon Redshift supports automated and manual backup mechanisms.

## Snapshot Features

* Snapshots are stored internally in Amazon S3.
* Backups are incremental, storing only changed data.
* Snapshots can restore entire clusters.

## Automated Snapshots

* Created every 8 hours, every 5 GB of changes, or based on schedules.
* Retention can be configured between 1 and 35 days.

## Manual Snapshots

* Retained until explicitly deleted.

## Cross-Region Disaster Recovery

* Snapshots can automatically copy to another AWS Region.
* Supports both automated and manual snapshots.

## Multi-AZ Support

* Some Redshift cluster types support Multi-AZ deployments.

---

# Amazon Redshift Spectrum

Redshift Spectrum allows Redshift clusters to query data directly from Amazon S3.

## Key Features

* No need to load S3 data into Redshift tables.
* Queries are processed using dedicated Redshift Spectrum nodes.
* Requires an active Redshift cluster.

## Benefits

* Reduces storage duplication.
* Simplifies analytics on large datasets stored in S3.

---

# Amazon OpenSearch Service

Amazon OpenSearch Service is a managed search and analytics platform.

## Key Features

* Successor to Amazon Elasticsearch Service.
* Supports full-text and partial-match searches.
* Can search across nearly any field within documents.
* Available in managed cluster and serverless deployment models.
* Integrates with data ingestion services.

## Data Sources

* Amazon Kinesis Data Firehose
* AWS IoT
* Amazon CloudWatch Logs

## Security Features

* Amazon Cognito authentication
* IAM authorization
* KMS encryption
* TLS encryption in transit

## Visualization

* Includes OpenSearch Dashboards for analytics and monitoring.

## Common Use Cases

* Log analytics
* Application monitoring
* Search engines
* Real-time operational analytics

---

# Amazon EMR Overview

Amazon EMR (Elastic MapReduce) is a managed big data processing platform.

## Key Features

* Simplifies deployment of Hadoop-based clusters.
* Supports processing very large datasets.
* Can scale to hundreds of EC2 instances.
* Bundled with popular big data tools.

## Included Frameworks

* Apache Spark
* HBase
* Presto
* Apache Flink

## Benefits

* Automated provisioning and configuration.
* Auto-scaling support.
* Integration with EC2 Spot Instances for cost savings.

## Common Use Cases

* Big data analytics
* Machine learning workloads
* Web indexing
* Data transformation pipelines

---

# Amazon EMR Node Types and Purchasing Options

## Node Types

### Master Node

* Manages the cluster.
* Coordinates workloads.
* Monitors cluster health.

### Core Node

* Executes processing tasks.
* Stores cluster data.

### Task Node

* Optional worker nodes used only for processing.
* Commonly deployed using Spot Instances.

## Purchasing Models

### On-Demand Instances

* Reliable and predictable.
* Not interrupted by AWS.

### Reserved Instances

* Lower cost for long-term workloads.
* Requires commitment periods.

### Spot Instances

* Lowest cost option.
* Can be interrupted at any time.

## Cluster Types

* Long-running clusters
* Temporary or transient clusters

---

# Amazon QuickSight Overview

Amazon QuickSight is a serverless business intelligence service used for data visualization and analytics.

## Key Features

* Machine learning-powered analytics platform.
* Automatically scalable.
* Supports embedded dashboards.
* Uses session-based pricing.

## Common Use Cases

* Business analytics
* Interactive dashboards
* Ad-hoc data analysis
* Executive reporting

## Data Integrations

* Amazon RDS
* Amazon Aurora
* Amazon Athena
* Amazon Redshift
* Amazon S3

## SPICE Engine

* In-memory calculation engine for faster analytics.
* Improves dashboard performance when importing datasets.

## Enterprise Edition Features

* Column-level security support.

---

# Amazon QuickSight Dashboards and Analysis

## User Management

* Standard edition supports users.
* Enterprise edition supports both users and groups.
* QuickSight identities are separate from IAM identities.

## Dashboards

* Dashboards are read-only views of analyses.
* Preserve filters, sorting, parameters, and controls.
* Must be published before sharing.

## Sharing Options

* Dashboards and analyses can be shared with users or groups.
* Dashboard viewers may access underlying datasets depending on permissions.

---

# AWS Glue Overview

AWS Glue is a fully managed ETL (Extract, Transform, Load) service.

## Key Features

* Serverless data integration platform.
* Prepares and transforms data for analytics.
* Simplifies data pipeline creation.

---

# AWS Glue Important Features

## Glue Job Bookmarks

* Prevent duplicate processing of previously processed data.

## Glue DataBrew

* Provides visual tools for cleaning and normalizing datasets.
* Includes pre-built transformations.

## Glue Studio

* Graphical interface for creating, running, and monitoring ETL jobs.

## Glue Streaming ETL

* Built on Apache Spark Structured Streaming.
* Supports streaming data sources such as:

  * Amazon Kinesis Data Streams
  * Apache Kafka
  * Amazon MSK

---

# AWS Lake Formation

AWS Lake Formation simplifies the creation and management of data lakes.

## Key Features

* Fully managed service for building centralized data lakes.
* Automates ingestion, cleansing, transformation, and cataloging.
* Supports both structured and unstructured data.
* Uses machine learning for deduplication and transformations.

## Supported Data Sources

* Amazon S3
* Amazon RDS
* Relational databases
* NoSQL databases

## Security Features

* Fine-grained access controls.
* Supports row-level and column-level permissions.

## Architecture

* Built on top of AWS Glue.

---

# Amazon Managed Service for Apache Flink

Previously known as Kinesis Data Analytics for Apache Flink.

## Key Features

* Managed Apache Flink environment on AWS.
* Supports Java, Scala, and SQL.
* Designed for real-time stream processing.
* Provides automatic scaling and parallel processing.

## Reliability Features

* Application backups through checkpoints and snapshots.

## Important Note

* Apache Flink does not directly consume data from Amazon Kinesis Data Firehose.

---

# Amazon Managed Streaming for Apache Kafka (Amazon MSK)

Amazon MSK is a fully managed Apache Kafka service.

## Key Features

* Alternative to Amazon Kinesis.
* Simplifies Kafka cluster management.
* Automatically manages Kafka brokers and ZooKeeper nodes.
* Deploys within customer VPCs.
* Supports Multi-AZ high availability.
* Uses EBS volumes for persistent storage.

## Reliability Features

* Automatic recovery from common Kafka failures.

## MSK Serverless

* Eliminates capacity management.
* Automatically scales compute and storage resources.

---

# Kinesis Data Streams vs Amazon MSK

## Amazon Kinesis Data Streams

* Maximum message size of 1 MB.
* Uses shards for scalability.
* Supports shard splitting and merging.
* TLS encryption in transit.
* KMS encryption at rest.

## Amazon MSK

* Default message size is 1 MB but can be increased.
* Uses Kafka topics and partitions.
* Partitions can only be added, not reduced.
* Supports plaintext or TLS encryption in transit.
* Uses KMS for encryption at rest.

---

# Big Data Ingestion Pipeline

A modern analytics pipeline often requires fully serverless, scalable services.

## Common Requirements

* Real-time data collection
* Serverless architecture
* Data transformation capabilities
* SQL-based querying
* Report generation and storage
* Data warehousing and dashboard visualization

---

# Big Data Ingestion Pipeline Architecture Discussion

## IoT Data Collection

* AWS IoT Core collects data from IoT devices.

## Real-Time Streaming

* Amazon Kinesis Data Streams ingests streaming data.

## Data Delivery

* Amazon Kinesis Data Firehose delivers transformed data to Amazon S3 in near real time.

## Data Transformation

* AWS Lambda can process and transform streaming data.

## Event Notifications

* Amazon S3 can send notifications to Amazon SQS.
* AWS Lambda can consume SQS messages for additional processing.

## Querying and Analytics

* Amazon Athena performs serverless SQL analysis on S3 data.
* Query results are stored back in Amazon S3.

## Reporting and Visualization

* Amazon QuickSight and Amazon Redshift can generate dashboards and reports from processed datasets.


