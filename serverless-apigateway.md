```md
# Amazon API Gateway

## What is API Gateway?

Amazon API Gateway is a managed service used to create, publish, secure, and monitor APIs.

---

## API Gateway Architecture

```text
Client
   │
   ▼
API Gateway
   │
   ▼
AWS Lambda
   │
   ▼
DynamoDB
````

---

## Key Features

* Authentication
* Authorization
* API versioning
* Rate limiting
* Monitoring
* Request validation
* Response caching

---

## Integration Types

### Lambda Integration

Invoke Lambda functions directly.

### HTTP Integration

Connect to backend HTTP services.

### AWS Service Integration

Directly integrate with AWS services such as:

* SQS
* Step Functions
* Kinesis

---

## Endpoint Types

| Endpoint Type  | Purpose             |
| -------------- | ------------------- |
| Edge-Optimized | Global users        |
| Regional       | Same-region users   |
| Private        | Internal VPC access |

---

## API Security

### Authentication Options

* IAM
* Cognito
* Lambda Authorizers

### HTTPS Support

Uses AWS Certificate Manager (ACM).

---

## API Gateway + Kinesis Example

```text
Client
   │
   ▼
API Gateway
   │
   ▼
Kinesis Data Streams
   │
   ▼
Kinesis Firehose
   │
   ▼
Amazon S3
```

````
