# AWS Monitoring, Auditing, and Performance Services

# Amazon CloudWatch Overview

Amazon CloudWatch is AWS’s monitoring and observability platform used to collect metrics, logs, and operational data from AWS resources and applications.

---

# Amazon CloudWatch Metrics

CloudWatch Metrics are numerical values collected over time for AWS resources and applications.

## Key Concepts

### Metrics

* Metrics represent measurable values such as:

  * CPU utilization
  * Network traffic
  * Disk activity
* Metrics are grouped into namespaces.

### Dimensions

* Dimensions are metadata attributes attached to metrics.
* Examples include:

  * Instance ID
  * Environment name
  * Application name
* A metric can contain up to 30 dimensions.

### Timestamps

* Every metric includes a timestamp indicating when the data was collected.

## Features

* Create CloudWatch dashboards for visualization.
* Publish custom metrics such as memory utilization.

---

# CloudWatch Metric Streams

CloudWatch Metric Streams continuously deliver metrics to external destinations with near real-time latency.

## Supported Destinations

* Amazon Kinesis Data Firehose
* Third-party monitoring tools such as:

  * Datadog
  * Dynatrace
  * New Relic
  * Splunk
  * Sumo Logic

## Features

* Low-latency streaming.
* Ability to filter and stream only selected metrics.

---

# Amazon CloudWatch Logs

CloudWatch Logs centralizes application and infrastructure logs.

## Key Concepts

### Log Groups

* Containers for organizing related logs.
* Typically represent applications or environments.

### Log Streams

* Individual log sources within a log group.
* Examples include EC2 instances, containers, or application log files.

## Features

* Configurable log retention periods.
* Logs are encrypted by default.
* Optional customer-managed KMS encryption.

## Log Destinations

CloudWatch Logs can export or stream logs to:

* Amazon S3
* Amazon Kinesis Data Streams
* Amazon Kinesis Data Firehose
* AWS Lambda
* Amazon OpenSearch Service

---

# CloudWatch Logs Sources

CloudWatch Logs can collect logs from multiple AWS services and environments.

## Common Sources

* AWS SDKs
* CloudWatch Logs Agent
* CloudWatch Unified Agent
* AWS Elastic Beanstalk
* Amazon ECS containers
* AWS Lambda functions
* VPC Flow Logs
* Amazon API Gateway
* AWS CloudTrail
* Amazon Route 53 DNS query logs

---

# CloudWatch Logs Insights

CloudWatch Logs Insights is a query service for searching and analyzing logs.

## Key Features

* Query logs using a dedicated query language.
* Automatically identifies fields in AWS service logs and JSON logs.
* Supports:

  * Filtering
  * Aggregations
  * Sorting
  * Event limiting
* Save queries and add results to CloudWatch Dashboards.
* Query logs across multiple AWS accounts.

## Important Note

* Logs Insights is designed for log analysis, not real-time streaming analytics.

## Common Use Cases

* Finding specific IP addresses in logs
* Counting application errors
* Troubleshooting application issues

---

# CloudWatch Logs S3 Export

CloudWatch Logs can export log data to Amazon S3.

## Important Details

* Export operations may take up to 12 hours.
* Uses the `CreateExportTask` API.
* Not suitable for real-time processing.

## Recommendation

Use CloudWatch Logs Subscriptions for near real-time log streaming.

---

# CloudWatch Logs Subscriptions

CloudWatch Logs Subscriptions provide near real-time log streaming.

## Supported Destinations

* Amazon Kinesis Data Streams
* Amazon Kinesis Data Firehose
* AWS Lambda

## Features

* Subscription filters allow selective log forwarding.
* Supports cross-account log streaming.

---

# CloudWatch Logs for Amazon EC2

EC2 instances do not automatically send logs to CloudWatch.

## Requirements

* Install a CloudWatch agent on the instance.
* Configure IAM permissions correctly.

## Additional Support

* The CloudWatch agent can also monitor on-premises servers.

---

# CloudWatch Logs Agent vs Unified Agent

## CloudWatch Logs Agent

* Legacy monitoring agent.
* Only sends logs to CloudWatch Logs.

## CloudWatch Unified Agent

* Modern replacement agent.
* Collects both logs and advanced system metrics.
* Supports centralized configuration through AWS Systems Manager Parameter Store.

## Additional Metrics Collected

* RAM usage
* Running processes
* Disk utilization
* Network statistics

---

# CloudWatch Unified Agent Metrics

The Unified Agent collects detailed operating system metrics.

## CPU Metrics

* Active
* Idle
* User
* System
* Steal time

## Disk Metrics

* Free space
* Used space
* Read and write operations
* IOPS

## Memory Metrics

* Free memory
* Used memory
* Cached memory

## Network Metrics

* TCP and UDP connections
* Packet counts
* Network throughput

## Process Metrics

* Running processes
* Sleeping processes
* Blocked processes
* Idle processes

## Swap Metrics

* Used swap
* Free swap
* Swap usage percentage

---

# CloudWatch Alarms

CloudWatch Alarms monitor metrics and trigger actions when thresholds are reached.

## Alarm States

* OK
* INSUFFICIENT_DATA
* ALARM

## Features

* Supports thresholds based on:

  * Average
  * Maximum
  * Minimum
  * Percentiles
* High-resolution alarms support intervals as low as 10 seconds.

---

# CloudWatch Alarm Targets

CloudWatch Alarms can trigger automated actions.

## Common Targets

* Stop EC2 instances
* Reboot EC2 instances
* Recover EC2 instances
* Trigger Auto Scaling actions
* Send notifications through Amazon SNS

---

# CloudWatch Composite Alarms

Composite Alarms combine multiple alarms into a single logical condition.

## Features

* Supports AND and OR logic.
* Reduces alert noise.
* Useful for complex monitoring scenarios.

---

# EC2 Instance Recovery

CloudWatch supports automatic EC2 instance recovery.

## Status Checks

* Instance status checks monitor the virtual machine.
* System status checks monitor underlying AWS hardware.
* EBS checks validate attached storage volumes.

## Recovery Benefits

* Preserves:

  * Private IP addresses
  * Public IP addresses
  * Elastic IP addresses
  * Metadata
  * Placement group configuration

---

# CloudWatch Alarm Best Practices

## Additional Features

* Create alarms using CloudWatch Logs metric filters.
* Test alarms manually using the AWS CLI.

## Example CLI Command

```bash
aws cloudwatch set-alarm-state \
  --alarm-name "myalarm" \
  --state-value ALARM \
  --state-reason "testing purposes"
```

---

# CloudWatch Network Synthetic Monitor

CloudWatch Network Synthetic Monitor helps identify network performance issues.

## Key Features

* Tests connectivity between AWS and on-premises environments.
* Detects:

  * Packet loss
  * Latency
  * Jitter
* No agents required.
* Supports ICMP and TCP testing.
* Works with:

  * AWS Direct Connect
  * Site-to-Site VPN connections

## Integration

* Publishes monitoring data to CloudWatch Metrics.

---

# Amazon EventBridge Overview

Amazon EventBridge is an event-driven service for routing and processing events.

## Common Use Cases

* Scheduled jobs using cron expressions
* Event-driven automation
* Triggering AWS Lambda functions
* Sending messages to SNS and SQS

---

# Amazon EventBridge Features

## Event Buses

* Event buses can receive events from multiple AWS accounts.
* Resource-based policies control permissions.

## Event Archiving

* Events can be archived indefinitely or for a configured retention period.
* Archived events can be replayed.

---

# EventBridge Schema Registry

The Schema Registry automatically discovers and stores event schemas.

## Key Features

* Infers schema structures from event data.
* Generates application code based on schemas.
* Supports schema versioning.

## Benefits

* Simplifies event-driven application development.
* Reduces parsing and integration errors.

---

# EventBridge Resource-Based Policies

Resource-based policies manage access to EventBridge event buses.

## Common Use Cases

* Allowing cross-account event sharing.
* Aggregating events across AWS Organizations.
* Managing permissions between AWS Regions.

---

# CloudWatch Container Insights

CloudWatch Container Insights provides monitoring for containerized workloads.

## Supported Platforms

* Amazon ECS
* Amazon EKS
* Kubernetes on EC2
* AWS Fargate

## Features

* Collects metrics and logs from containers.
* Uses a containerized CloudWatch Agent in Kubernetes environments.

---

# CloudWatch Lambda Insights

CloudWatch Lambda Insights provides advanced monitoring for AWS Lambda functions.

## Key Features

* Collects system-level metrics such as:

  * CPU usage
  * Memory usage
  * Disk usage
  * Network activity
* Tracks cold starts and worker shutdowns.
* Delivered through a Lambda Layer.

## Benefits

* Simplifies troubleshooting for serverless applications.

---

# CloudWatch Contributor Insights

CloudWatch Contributor Insights analyzes logs and identifies high-impact contributors.

## Features

* Displays top-N contributors.
* Tracks usage patterns and unique contributors.
* Helps identify:

  * High-traffic hosts
  * Heavy network users
  * Error-generating URLs

## Supported Sources

* VPC Flow Logs
* DNS logs
* Other AWS-generated logs

## Additional Capabilities

* Create custom analysis rules.
* Use AWS-provided built-in rules.

---

# CloudWatch Application Insights

CloudWatch Application Insights helps monitor and troubleshoot applications.

## Key Features

* Automatically creates monitoring dashboards.
* Detects application issues and anomalies.
* Uses Amazon SageMaker for intelligent analysis.

## Supported Technologies

* Java applications
* .NET applications
* Microsoft IIS
* Databases

## Supported AWS Services

* Amazon EC2
* Amazon EBS
* Amazon RDS
* Elastic Load Balancing
* Auto Scaling Groups
* AWS Lambda
* Amazon SQS
* DynamoDB
* Amazon S3
* Amazon ECS
* Amazon EKS
* Amazon SNS
* Amazon API Gateway

## Integrations

* Amazon EventBridge
* AWS Systems Manager OpsCenter

---

# CloudWatch Insights and Operational Visibility Summary

## Container Insights

* Monitoring for ECS, EKS, Kubernetes, and Fargate.

## Lambda Insights

* Advanced monitoring for serverless applications.

## Contributor Insights

* Identifies top contributors from log data.

## Application Insights

* Automated application troubleshooting dashboards.

---

# AWS CloudTrail Overview

AWS CloudTrail provides governance, auditing, and compliance monitoring for AWS accounts.

## Key Features

* Enabled by default in AWS accounts.
* Records API calls and account activity.
* Tracks actions performed through:

  * AWS Console
  * AWS SDKs
  * AWS CLI
  * AWS services

## Log Storage Options

* Amazon S3
* Amazon CloudWatch Logs

## Scope

* Trails can monitor:

  * All AWS Regions
  * A single AWS Region

## Important Tip

When investigating deleted resources or configuration changes, CloudTrail is typically the first service to review.

---

# CloudTrail Events

CloudTrail records two primary categories of events.

## Management Events

These events track management operations on AWS resources.

### Examples

* IAM policy attachments
* Subnet creation
* CloudTrail trail configuration

### Features

* Logged by default.
* Supports separating:

  * Read events
  * Write events

---

## Data Events

Data events track high-volume resource operations.

### Examples

* Amazon S3 object operations:

  * GetObject
  * PutObject
  * DeleteObject
* AWS Lambda Invoke API calls

### Important Note

* Data events are disabled by default due to high event volume.

---

# CloudTrail Insights

CloudTrail Insights detects unusual API activity.

## Examples of Detected Anomalies

* Sudden increases in IAM activity
* Service limit issues
* Irregular provisioning behavior
* Missing maintenance activities

## How It Works

* Builds a baseline from normal management activity.
* Continuously analyzes write events for anomalies.

## Outputs

* Findings appear in the CloudTrail console.
* Events can be stored in Amazon S3.
* EventBridge events can trigger automated workflows.

---

# CloudTrail Event Retention

## Default Retention

* CloudTrail stores events for 90 days.

## Long-Term Retention

* Send logs to Amazon S3 for permanent storage.
* Use Amazon Athena to query historical logs.

---

# AWS Config Overview

AWS Config records resource configurations and evaluates compliance.

## Key Features

* Tracks configuration changes over time.
* Provides compliance auditing.
* Sends notifications when resources change.
* Operates on a per-region basis.
* Supports aggregation across accounts and regions.
* Stores configuration history in Amazon S3.

## Common Questions Solved by AWS Config

* Are security groups exposing unrestricted SSH access?
* Do S3 buckets allow public access?
* How has a load balancer configuration changed over time?

---

# AWS Config Rules

Config Rules evaluate AWS resources against compliance policies.

## Rule Types

### Managed Rules

* AWS provides more than 75 prebuilt rules.

### Custom Rules

* Created using AWS Lambda.

## Example Rules

* Ensure EBS volumes use the gp2 type.
* Verify EC2 instances use approved instance types.

## Evaluation Methods

* Triggered by configuration changes.
* Evaluated at scheduled intervals.

## Important Note

AWS Config Rules monitor compliance but do not block actions.

---

# AWS Config Remediation

AWS Config can automatically remediate non-compliant resources.

## Features

* Uses AWS Systems Manager Automation Documents.
* Supports AWS-managed or custom remediation workflows.
* Custom remediation can invoke AWS Lambda.
* Supports remediation retries.

---

# AWS Config Notifications

AWS Config integrates with EventBridge and SNS for notifications.

## Features

* Sends compliance change notifications.
* Triggers automated responses through EventBridge.
* Supports SNS filtering for selective alerts.

---

# CloudWatch vs CloudTrail vs AWS Config

## Amazon CloudWatch

* Performance monitoring
* Metrics and dashboards
* Logging and alerting

## AWS CloudTrail

* API activity auditing
* Governance and compliance tracking
* User activity monitoring

## AWS Config

* Resource configuration tracking
* Compliance validation
* Configuration history and timelines

---

# Example: Monitoring an Elastic Load Balancer

## Using CloudWatch

* Monitor incoming connections.
* Track error rates over time.
* Build dashboards for performance visibility.

## Using AWS Config

* Track security group changes.
* Monitor load balancer configuration updates.
* Verify SSL certificates remain attached.

## Using AWS CloudTrail

* Identify who modified the load balancer.
* Review API calls related to configuration changes.







