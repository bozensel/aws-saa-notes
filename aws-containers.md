# Containers on AWS

## What is Docker?
Docker is a platform used to develop and deploy applications inside containers.
Containers package applications with all dependencies, ensuring they run consistently across environments.

### Benefits:
- Runs on any OS or machine
- No compatibility issues
- Predictable behavior
- Easy deployment and maintenance
- Supports any programming language and technology

### Use Cases:
- Microservices architecture
- Migrating on-prem apps to AWS

---

## Where are Docker Images Stored?

- Docker Hub (Public registry)
- Amazon ECR (Elastic Container Registry)
  - Private repositories
  - Public gallery

---

## Docker vs Virtual Machines

| Feature        | Docker Containers        | Virtual Machines        |
|----------------|-------------------------|------------------------|
| Resource Usage | Shared with host        | Dedicated per VM       |
| Speed          | Lightweight & fast      | Slower boot time       |
| Isolation      | Process-level           | Full OS isolation      |

---

## Container Management on AWS

- Amazon ECS – AWS native container platform
- Amazon EKS – Managed Kubernetes
- AWS Fargate – Serverless containers
- Amazon ECR – Image storage

---

## Amazon ECS

### EC2 Launch Type
- You manage EC2 instances
- ECS Agent runs on each instance

### Fargate Launch Type
- No infrastructure management
- Fully serverless

---

## ECS IAM Roles

- EC2 Instance Role → used by ECS agent
- Task Role → assigned per container task

---

## Load Balancing in ECS

- ALB (recommended)
- NLB (high performance)
- Classic LB (legacy)

---

## ECS Storage (EFS)

- Shared storage across AZs
- Works with EC2 & Fargate

---

## ECS Auto Scaling

- Based on CPU, memory, ALB traffic
- Types:
  - Target tracking
  - Step scaling
  - Scheduled scaling

---

## Architecture Diagram

```
        ALB
         |
   -------------
   |           |
 ECS Task   ECS Task
     \       //
        Amazon EFS
```

---

## Amazon ECR

- Stores Docker images
- Integrated with ECS/EKS
- Features:
  - Versioning
  - Lifecycle policies
  - Security scanning

---

## Amazon EKS

- Managed Kubernetes service
- Supports EC2 or Fargate
- Cloud-agnostic

---

## EKS Node Types

- Managed Nodes
- Self-managed Nodes
- Fargate

---

## EKS Storage

Supports:
- EBS
- EFS
- FSx

---

## AWS App Runner

- Fully managed deployment
- Auto scaling + load balancing
- Supports code or container images

---

## AWS App2Container

- Converts legacy apps to containers
- Supports Java and .NET
- Deploy to ECS, EKS, App Runner

---

## Summary Flow

```
Developer → Docker → ECR → ECS/EKS → Fargate
```





