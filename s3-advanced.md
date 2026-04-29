# Amazon S3 – Advanced

## 🔄 Moving Between Storage Classes

Amazon S3 allows you to move objects between different storage classes to optimize cost and performance.

- Frequently accessed data → keep in **S3 Standard**
- Infrequent access → move to **Standard-IA**
- Archive data → move to **Glacier** or **Glacier Deep Archive**

These transitions can be automated using **Lifecycle Rules**.

---

## ⚙️ Lifecycle Rules

Lifecycle rules help automate storage management.

### Transition Actions
- Move objects to another storage class after a defined time
  - Example:
    - After 60 days → Standard-IA
    - After 6 months → Glacier

### Expiration Actions
- Automatically delete objects after a specified period
- Common use cases:
  - Delete logs after 365 days
  - Remove old object versions
  - Clean up incomplete multipart uploads

### Filtering Options
Rules can target:
- Prefix (e.g. `s3://mybucket/images/*`)
- Tags (e.g. `Department=Finance`)

---

## 📊 Scenario 1 – Image Processing

```
        ┌────────────────────┐
        │   Original Images  │
        │   (S3 Standard)    │
        └─────────┬──────────┘
                  │ 60 days
                  ▼
        ┌────────────────────┐
        │      Glacier       │
        └────────────────────┘


        ┌────────────────────┐
        │    Thumbnails      │
        │   (One Zone-IA)    │
        └─────────┬──────────┘
                  │ 60 days
                  ▼
        ┌────────────────────┐
        │      Deleted       │
        └────────────────────┘
```

- Source images: Standard → Glacier after 60 days  
- Thumbnails: One Zone-IA → deleted after 60 days  

---

## 📊 Scenario 2 – Recovery Policy

Requirement:
- Immediate recovery for 30 days
- Recovery within 48 hours up to 365 days

Solution:
- Enable **Versioning**
- Use lifecycle rules:
  - Noncurrent versions → Standard-IA
  - Later → Glacier Deep Archive

---

## 📈 Storage Class Analysis

- Provides recommendations for transitioning data
- Works with Standard and Standard-IA
- Updates daily
- Initial insights available after 24–48 hours

---

## 💸 Requester Pays

Default:
- Bucket owner pays for storage and data transfer

Requester Pays:
- Requester pays for:
  - Requests
  - Data downloads

Useful when sharing large datasets across accounts.

---

## 🔔 S3 Event Notifications

S3 can trigger events such as:
- Object Created
- Object Deleted
- Object Restored
- Replication events

### Example Flow

```
        ┌──────────────┐
        │ Upload File  │
        └──────┬───────┘
               ▼
        ┌──────────────┐
        │      S3      │
        └──────┬───────┘
               ▼
        ┌──────────────┐
        │    Lambda    │
        │ Process Data │
        └──────────────┘
```

- Supports filtering (e.g. `*.jpg`)
- Events usually delivered within seconds

---

## 🔗 EventBridge Integration

- Advanced filtering using JSON rules
- Multiple targets:
  - Step Functions
  - Kinesis
  - Lambda

Features:
- Event archiving
- Replay capability
- Reliable delivery

---

## ⚡ Baseline Performance

- Automatically scales to high request rates
- Latency: ~100–200 ms

### Per Prefix Limits
- 3,500 write operations/sec
- 5,500 read operations/sec

### Scaling Example

```
bucket/
 ├── app1/   → prefix 1
 ├── app2/   → prefix 2
 ├── logs/   → prefix 3
 └── data/   → prefix 4
```

Spreading traffic across prefixes increases throughput.

---

## 🚀 Performance Optimization

### Multipart Upload
- Required for files > 5GB
- Recommended for files > 100MB
- Enables parallel uploads

---

### Transfer Acceleration

```
User → Edge Location → S3 Bucket
```

- Uses AWS edge locations
- Speeds up uploads globally

---

### Byte-Range Fetches
- Download specific parts of objects
- Enables parallel reads
- Improves resilience

---

## 🔧 S3 Batch Operations

Perform bulk operations on many objects:

- Update metadata
- Copy objects
- Encrypt data
- Restore from Glacier
- Trigger Lambda functions

### Workflow

```
        ┌──────────────┐
        │ Object List  │
        └──────┬───────┘
               ▼
        ┌──────────────┐
        │ Batch Job    │
        └──────┬───────┘
               ▼
        ┌──────────────┐
        │ Execute Task │
        └──────────────┘
```

---

## 📊 S3 Storage Lens

Provides visibility across your storage.

### Capabilities
- Analyze usage across accounts and regions
- Identify cost-saving opportunities
- Monitor data protection practices

---

## 📊 Storage Lens Metrics

### Summary Metrics
- Storage size, object count

### Cost Optimization
- Identify unused or inefficient storage

### Data Protection
- Versioning status
- Encryption usage
- Replication configuration

### Access Management
- Object ownership settings

### Event Metrics
- Track event notification usage

### Performance Metrics
- Transfer acceleration usage

### Activity Metrics
- Requests (GET, PUT, etc.)
- Data transfer volumes

### Status Code Metrics
- HTTP responses (200, 403, 404)

---

## 💰 Free vs Paid Metrics

### Free Tier
- ~28 metrics
- 14 days retention

### Advanced (Paid)
- Extended metrics
- 15 months retention
- CloudWatch integration
- Prefix-level insights
