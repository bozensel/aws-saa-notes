# Files Structure

```text
serverless-overview.md
lambda.md
```

````
# AWS Serverless Overview

## What is Serverless?

Serverless is a cloud computing model where developers focus only on writing and deploying code while AWS manages the infrastructure, scaling, availability, and maintenance.

Even though servers still exist, users do not provision or manage them directly.

---

## Key Benefits

- No infrastructure management
- Automatic scaling
- Pay-per-use pricing
- Faster deployments
- Event-driven architecture
- High availability

---

## Common AWS Serverless Services

| Service | Purpose |
|---|---|
| AWS Lambda | Run code without servers |
| DynamoDB | Managed NoSQL database |
| API Gateway | API management |
| Cognito | User authentication |
| Step Functions | Workflow orchestration |
| SNS/SQS | Messaging services |
| Fargate | Serverless containers |

---

## Traditional vs Serverless

| Traditional Infrastructure | Serverless |
|---|---|
| Manage servers | No server management |
| Manual scaling | Automatic scaling |
| Pay for uptime | Pay only for usage |
| Capacity planning required | Elastic by default |

---

## Serverless Architecture Example

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

````

---

# lambda.md

```md
# AWS Lambda

## What is AWS Lambda?

AWS Lambda is a serverless compute service that allows you to run code without provisioning or managing servers.

AWS automatically handles:

- Infrastructure
- Scaling
- Availability
- Monitoring
- Fault tolerance

---

## Lambda vs EC2

| Amazon EC2 | AWS Lambda |
|---|---|
| Server management required | Fully serverless |
| Always running | Runs only when invoked |
| Manual scaling | Automatic scaling |
| Pay for uptime | Pay per execution |

---

## Lambda Architecture

```text
Event Source
     │
     ▼
┌─────────────┐
│ AWS Lambda  │
└─────────────┘
     │
     ├── DynamoDB
     ├── S3
     ├── SNS/SQS
     └── API Gateway
````

---

## Supported Languages

* Python
* Node.js
* Java
* C#
* Ruby
* PowerShell
* Custom runtimes
* Container images

---

## Lambda Limits

| Feature             | Limit          |
| ------------------- | -------------- |
| Maximum runtime     | 15 minutes     |
| Memory              | 128 MB – 10 GB |
| Deployment ZIP size | 50 MB          |
| Default concurrency | 1000           |

---

## Concurrency

Concurrency defines how many Lambda functions can execute simultaneously.

### Reserved Concurrency

* Guarantees capacity
* Prevents overuse

### Provisioned Concurrency

* Keeps functions warm
* Eliminates cold starts

---

## Cold Starts

A cold start happens when AWS creates a new execution environment.

This includes:

* Runtime initialization
* Loading dependencies
* Running initialization code

---

## Lambda Networking

### Default Behavior

Lambda runs outside your VPC by default.

### Lambda Inside a VPC

To access private resources:

* Select subnets
* Attach security groups
* AWS creates ENIs automatically

---

## Lambda + RDS Proxy

RDS Proxy helps manage database connections efficiently.

### Benefits

* Connection pooling
* Improved scalability
* Faster failover
* IAM authentication support

---

## CloudFront Functions vs Lambda@Edge

| Feature        | CloudFront Functions | Lambda@Edge         |
| -------------- | -------------------- | ------------------- |
| Runtime        | JavaScript           | Node.js / Python    |
| Latency        | Very low             | Higher              |
| Use Case       | Header rewrites      | Advanced processing |
| External calls | No                   | Yes                 |

---

## Lambda Pricing

Pricing is based on:

* Number of requests
* Execution duration
* Allocated memory

````






