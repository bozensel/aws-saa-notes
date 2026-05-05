# AWS Integration & Messaging

## Introduction

As systems grow, different applications need to communicate with each other. There are two main communication patterns:

### 1. Synchronous Communication
- Direct application-to-application calls  
- Example: REST API calls  
- Problem: Can break under sudden traffic spikes  

### 2. Asynchronous (Event-Driven) Communication
- Applications communicate through intermediaries  
- Improves scalability and fault tolerance  

**Common AWS services for async communication:**
- SQS → Queue-based model  
- SNS → Publish/Subscribe model  
- Kinesis → Real-time streaming  

---

## Amazon SQS (Simple Queue Service)

### Standard Queue
- Fully managed message queue service  
- Unlimited throughput  
- Message retention: 4–14 days  
- Low latency (<10 ms)  
- Max message size: 1 MB  
- At-least-once delivery  
- Best-effort ordering  

### Producing Messages
- Messages sent using SendMessage API  
- Stored until consumed and deleted  

### Consuming Messages
- Consumers poll messages  
- Process them  
- Delete them using DeleteMessage API  

### Visibility Timeout
- Default: 30 seconds  
- Message becomes invisible after being read  

### FIFO Queue
- Guarantees ordering  
- Exactly-once processing  

---

## Amazon SNS (Simple Notification Service)

### Overview
- Pub/Sub messaging system  
- One message → many subscribers  

### Fan-Out Pattern
Producer → SNS Topic → Multiple Subscribers

---

## Amazon Kinesis Data Streams

### Overview
- Real-time data streaming service  

### Features
- Retention up to 365 days  
- Replay capability  
- Ordered data per partition key  

---

## Amazon Data Firehose

### Overview
- Fully managed data delivery service  

### Features
- Near real-time delivery  
- Auto-scaling  
- Data transformation via Lambda  

---

## SQS vs SNS vs Kinesis

| Feature | SQS | SNS | Kinesis |
|--------|-----|-----|--------|
| Model | Queue | Pub/Sub | Streaming |
| Data Flow | Pull | Push | Pull/Push |
| Persistence | Yes | No | Yes |

---

## Amazon MQ

### Overview
- Managed message broker  
- Supports MQTT, AMQP, STOMP, OpenWire  

---

## Architecture Example

Producer → SNS → SQS → Consumers

---

## Key Takeaways
- SQS for decoupling  
- SNS for broadcasting  
- Kinesis for streaming  
- Firehose for delivery  
- Amazon MQ for legacy apps  
