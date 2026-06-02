# AWS Advanced Solutions Architecture

This Markdown file contains reworded notes covering S3 Event Notifications, HPC, CloudFormation, SES, Pinpoint, Systems Manager, Cost Management, Outposts, AWS Batch, AppFlow, Amplify, Instance Scheduler, Well-Architected Framework, and Trusted Advisor.

## Included Topics

- Amazon S3 Event Notifications and EventBridge
- High Performance Computing (HPC)
- Data Transfer Services
- Compute and Networking for HPC
- Storage Options
- AWS Batch and ParallelCluster
- AWS CloudFormation
- Amazon SES
- Amazon Pinpoint
- AWS Systems Manager
- Cost Explorer and Cost Anomaly Detection
- AWS Outposts
- Amazon AppFlow
- AWS Amplify
- Instance Scheduler
- AWS Well-Architected Framework
- AWS Trusted Advisor

### Example Architecture Diagram

```text
Developer
    |
CloudFormation Template
    |
    v
+------------------+
| VPC              |
| EC2              |
| S3               |
| Load Balancer    |
+------------------+
    |
    v
AWS Deployment
```

## CloudFormation Summary

CloudFormation allows infrastructure to be defined as code and deployed automatically in the correct order.

Benefits:
- Repeatable deployments
- Version-controlled infrastructure
- Faster provisioning
- Cost visibility

## AWS Batch

AWS Batch runs large-scale batch processing workloads using containers on ECS and can automatically provision EC2 or Spot Instances.

## Well-Architected Framework

Six pillars:
1. Operational Excellence
2. Security
3. Reliability
4. Performance Efficiency
5. Cost Optimization
6. Sustainability

## Trusted Advisor

Provides recommendations across:
- Cost
- Security
- Performance
- Fault Tolerance
- Service Limits
- Operational Excellence



