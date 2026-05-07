```md
# Amazon DynamoDB

## What is DynamoDB?

Amazon DynamoDB is a fully managed NoSQL database designed for high performance and massive scalability.

---

## Core Features

- Serverless
- Multi-AZ replication
- Millisecond latency
- Automatic scaling
- IAM integration
- Fully managed

---

## DynamoDB Table Structure

```text
DynamoDB Table
    │
    ├── Item
    │      ├── Attribute
    │      ├── Attribute
    │      └── Attribute
````

---

## Capacity Modes

### Provisioned Mode

You define:

* Read Capacity Units (RCU)
* Write Capacity Units (WCU)

### On-Demand Mode

Automatically scales based on workload.

Best for unpredictable traffic.

---

## DynamoDB Accelerator (DAX)

DAX is an in-memory cache for DynamoDB.

### Benefits

* Microsecond latency
* Reduced read pressure
* No application changes required

---

## DynamoDB Streams

Captures table changes in real-time.

### Use Cases

* Trigger Lambda functions
* Real-time analytics
* Replication
* Auditing

---

## DynamoDB Global Tables

Provides active-active replication across multiple AWS regions.

### Benefits

* Low latency worldwide
* Disaster recovery
* High availability

---

## DynamoDB TTL

TTL automatically deletes expired records.

### Common Use Cases

* Session expiration
* Temporary records
* Compliance policies

---

## Backups

### Point-in-Time Recovery (PITR)

* Restore within the last 35 days

### On-Demand Backups

* Manual snapshots
* Long-term retention

---

## DynamoDB + S3

### Export to S3

Used for:

* Analytics
* Auditing
* ETL pipelines

### Import from S3

Supports:

* CSV
* DynamoDB JSON
* ION format

````
