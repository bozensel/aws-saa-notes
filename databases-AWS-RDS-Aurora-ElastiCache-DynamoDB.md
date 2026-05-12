# AWS Databases Overview

## Choosing the Right AWS Database

AWS offers a wide range of managed database services, and selecting the correct one depends on your application architecture and workload requirements.

### Important Factors to Consider

* Determine whether your workload is read-heavy, write-heavy, or balanced.
* Estimate throughput requirements and evaluate whether traffic fluctuates throughout the day.
* Understand how much data needs to be stored, how long it must be retained, and how quickly it may grow.
* Consider the average size of stored objects and the way applications will access the data.
* Define durability and availability requirements, especially if the database is the primary source of truth.
* Evaluate latency expectations and the number of concurrent users.
* Decide whether the data model should be relational, semi-structured, or schema-flexible.
* Determine whether SQL queries, joins, analytics, or reporting capabilities are required.
* Compare traditional licensed databases with cloud-native solutions such as Amazon Aurora.

---

# AWS Database Categories

## Relational Databases (SQL / OLTP)

Relational databases are best suited for structured datasets and applications requiring SQL queries, transactions, and joins.

### AWS Services

* Amazon RDS
* Amazon Aurora

---

## NoSQL Databases

NoSQL databases are designed for scalability and flexible schemas. They typically avoid joins and focus on high performance.

### AWS Services

* Amazon DynamoDB – document and key/value database
* Amazon ElastiCache – in-memory key/value caching
* Amazon Neptune – graph database
* Amazon DocumentDB – MongoDB-compatible document database
* Amazon Keyspaces – Apache Cassandra-compatible database

---

## Object Storage

Object storage is optimized for storing large files, backups, and archives.

### AWS Services

* Amazon S3 – scalable object storage
* Amazon Glacier – archival and backup storage

---

## Data Warehousing and Analytics

These services are designed for analytics, reporting, and business intelligence workloads.

### AWS Services

* Amazon Redshift
* Amazon Athena
* Amazon EMR

---

## Search Engines

Search services are optimized for indexing and searching unstructured or semi-structured data.

### AWS Service

* Amazon OpenSearch Service

---

## Graph Databases

Graph databases are ideal for storing highly connected datasets and relationships.

### AWS Service

* Amazon Neptune

---

## Ledger Databases

Ledger databases maintain immutable transaction records.

### AWS Service

* Amazon Quantum Ledger Database (QLDB)

---

## Time-Series Databases

Time-series databases are optimized for timestamped data generated continuously over time.

### AWS Service

* Amazon Timestream

---

# Amazon RDS Overview

Amazon RDS is a fully managed relational database service supporting multiple database engines.

## Supported Engines

* PostgreSQL
* MySQL
* Oracle
* Microsoft SQL Server
* MariaDB
* IBM DB2
* Amazon RDS Custom

## Key Features

* Provision compute resources and EBS storage independently.
* Storage can automatically scale when capacity requirements increase.
* Supports Multi-AZ deployments and Read Replicas for high availability and scaling.
* Integrated security using IAM, security groups, KMS encryption, and SSL/TLS.
* Automated backups with point-in-time recovery for up to 35 days.
* Manual snapshots for long-term retention.
* Managed maintenance and scheduled patching.
* Supports IAM database authentication and AWS Secrets Manager integration.
* RDS Custom allows deeper OS and database customization for Oracle and SQL Server.

## Common Use Cases

* Traditional relational applications
* OLTP workloads
* Applications requiring SQL queries and transactions

---

# Amazon Aurora Overview

Amazon Aurora is a cloud-native relational database designed for high performance and scalability.

## Compatibility

* MySQL-compatible
* PostgreSQL-compatible

## Architecture and Features

* Separates compute and storage layers.
* Data is replicated six times across three Availability Zones for durability.
* Self-healing and auto-scaling storage architecture.
* Reader and writer endpoints simplify cluster access.
* Supports automatic scaling of read replicas.
* Includes the same monitoring, security, and maintenance features available in Amazon RDS.
* Offers backup and restore capabilities.

## Aurora Enhancements

### Aurora Serverless

* Automatically adjusts capacity based on demand.
* Ideal for unpredictable or intermittent workloads.

### Aurora Global Database

* Supports up to 16 read instances per region.
* Cross-region replication can occur in under one second.

### Aurora Machine Learning

* Integrates with Amazon SageMaker and Amazon Comprehend.
* Enables machine learning directly from Aurora databases.

### Aurora Database Cloning

* Quickly creates new database clusters from existing ones.
* Faster than restoring snapshots.

## Common Use Cases

* High-performance relational applications
* Workloads requiring scalability and reduced administration
* Applications needing advanced cloud-native database features

---

# Amazon ElastiCache Overview

Amazon ElastiCache is a managed in-memory caching service supporting Redis and Memcached.

## Key Features

* Delivers sub-millisecond latency.
* Supports Redis clustering and sharding.
* Provides Multi-AZ deployments and read replicas.
* Uses IAM, security groups, KMS encryption, and Redis authentication for security.
* Supports backups, snapshots, and point-in-time recovery.
* AWS handles maintenance and patching.
* Requires application-level integration to take advantage of caching.

## Common Use Cases

* Database query caching
* Session storage for web applications
* High-speed key/value data access
* Applications requiring extremely fast read performance

---

# Amazon DynamoDB Overview

Amazon DynamoDB is a fully managed, serverless NoSQL database designed for massive scalability and low latency.

## Key Features

* Provides single-digit millisecond latency.
* Offers provisioned capacity with auto-scaling or on-demand capacity modes.
* Supports TTL-based expiration for temporary data.
* Highly available across multiple Availability Zones by default.
* Read and write operations scale independently.
* Supports transactions.

## Advanced Capabilities

### DynamoDB Accelerator (DAX)

* Provides microsecond-level read latency using in-memory caching.

### DynamoDB Streams

* Captures table changes in real time.
* Integrates with AWS Lambda and Amazon Kinesis.

### Global Tables

* Enables active-active replication across AWS Regions.

### Backup and Recovery

* Automated backups with point-in-time recovery for up to 35 days.
* On-demand backups available.
* Export data to Amazon S3 without consuming RCUs.
* Import data from Amazon S3 without consuming WCUs.

## Security

* Uses IAM for authentication and authorization.

## Common Use Cases

* Serverless application development
* Session management
* Distributed caching
* Applications with rapidly evolving schemas

---

# Amazon S3 Overview

Amazon S3 is a scalable object storage service designed for durability and virtually unlimited storage.

## Key Characteristics

* Functions as a key/value object store.
* Optimized for storing large objects.
* Supports objects up to 5 TB in size.
* Scales automatically without server management.
* Includes object versioning.

## Storage Classes

* S3 Standard
* S3 Intelligent-Tiering
* S3 Standard-Infrequent Access
* S3 Glacier storage classes

## Features

* Versioning
* Replication
* Encryption
* MFA Delete
* Access logging
* Lifecycle management

## Security Options

* IAM policies
* Bucket policies
* Access Control Lists (ACLs)
* S3 Access Points
* S3 Object Lambda
* Cross-Origin Resource Sharing (CORS)
* Object Lock and Vault Lock

## Encryption Options

* SSE-S3
* SSE-KMS
* SSE-C
* Client-side encryption
* TLS encryption in transit
* Default bucket encryption

## Performance and Automation

* Multipart uploads
* S3 Transfer Acceleration
* S3 Select
* S3 Batch Operations
* S3 Inventory reports
* Event notifications using SNS, SQS, Lambda, and EventBridge

## Common Use Cases

* Static website hosting
* Large file storage
* Backup repositories
* Media and content storage

---

# Amazon DocumentDB Overview

Amazon DocumentDB is a fully managed document database compatible with MongoDB workloads.

## Key Features

* Stores and indexes JSON-style document data.
* Built using AWS-managed infrastructure similar to Aurora.
* Highly available with replication across three Availability Zones.
* Storage automatically grows in 10 GB increments.
* Scales to millions of requests per second.

## Common Use Cases

* JSON document storage
* Content management systems
* Catalog and profile applications

---

# Amazon Neptune Overview

Amazon Neptune is a fully managed graph database optimized for highly connected datasets.

## Example Graph Relationships

* Users connected to friends
* Posts linked to comments
* Comments connected to likes
* Users interacting with shared content

## Key Features

* Highly available across three Availability Zones.
* Supports up to 15 read replicas.
* Stores billions of relationships.
* Executes graph queries with millisecond latency.
* Optimized for complex relationship-based queries.

## Common Use Cases

* Social networking platforms
* Recommendation engines
* Fraud detection systems
* Knowledge graphs such as Wikipedia-style datasets

---

# Amazon Neptune Streams

Neptune Streams provides a real-time sequence of graph database changes.

## Features

* Changes become available immediately after updates occur.
* Guarantees strict ordering without duplicates.
* Accessible through an HTTP REST API.

## Common Use Cases

* Triggering notifications on graph updates
* Synchronizing graph data with other systems such as S3, OpenSearch, or ElastiCache
* Cross-region graph replication

---

# Amazon Keyspaces Overview

Amazon Keyspaces is a fully managed Apache Cassandra-compatible database service.

## Key Features

* Serverless and automatically scalable.
* Replicates tables across multiple Availability Zones.
* Supports Cassandra Query Language (CQL).
* Delivers single-digit millisecond latency at scale.
* Handles thousands of requests per second.
* Supports on-demand and provisioned capacity modes with auto-scaling.
* Includes encryption, backups, and point-in-time recovery for up to 35 days.

## Common Use Cases

* IoT device data storage
* Time-series workloads
* Large-scale distributed applications

---

# Amazon Timestream Overview

Amazon Timestream is a serverless time-series database service built for high-scale event processing and analytics.

## Key Features

* Automatically scales up and down based on workload.
* Processes trillions of events per day.
* Delivers significantly better performance and lower cost compared to traditional relational databases.
* Supports SQL queries and scheduled query execution.
* Allows multi-measure records.
* Uses storage tiering to keep recent data in memory and historical data in lower-cost storage.
* Includes built-in analytics functions for near real-time pattern detection.
* Encrypts data both in transit and at rest.

## Common Use Cases

* IoT applications
* Operational monitoring systems
* Real-time analytics platforms
* Event-driven architectures



