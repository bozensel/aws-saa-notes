# High Availability, Scaling & Load Balancing (ELB + ASG)

---

## 📈 Scalability vs High Availability

### 🔹 Scalability
Ability of a system to handle increased load.

Types:
- **Vertical Scaling (scale up/down)** → increase instance size
- **Horizontal Scaling (scale out/in)** → add/remove instances

---

### 🔹 High Availability (HA)
Ensures the system remains operational even if part of it fails.

- Achieved by running across multiple **Availability Zones (AZs)**
- Goal: survive data center failures

---

## 🔼 Vertical Scaling

Increase resources of a single machine.

👉 Example:
- t3.micro → m5.large

Used for:
- Databases (RDS)
- Caching (ElastiCache)

⚠️ Limitation:
- Hardware limits

---

## 🔽 Horizontal Scaling

Add more instances to distribute load.

- Requires distributed architecture
- Common in modern web apps

👉 Example:
- Add more EC2 instances behind a Load Balancer

---

## 🌍 High Availability in AWS

Achieved by:
- Deploying across multiple AZs
- Using:
  - Load Balancer
  - Auto Scaling Group (ASG)

Types:
- Passive HA → standby (e.g., RDS Multi-AZ)
- Active HA → multiple active instances (web apps)

---

## ⚖️ EC2 Scaling Summary

- Vertical → bigger instance
- Horizontal → more instances
- HA → multi-AZ deployment

---

# ⚖️ Load Balancer (ELB)

A Load Balancer distributes incoming traffic across multiple targets (e.g., EC2).

---

## 🎯 Why Use a Load Balancer?

- Distribute traffic evenly
- Provide single entry point (DNS)
- Detect unhealthy instances
- Improve availability
- Handle SSL (HTTPS)
- Maintain session stickiness (optional)

---

## ☁️ Elastic Load Balancer (ELB)

Managed by AWS:
- No maintenance required
- Automatically highly available
- Integrated with AWS services

Works with:
- EC2
- Auto Scaling
- ECS
- Route 53
- AWS WAF

---

## ❤️ Health Checks

Used to verify instance health.

- Check endpoint (e.g., `/health`)
- Expected response: HTTP 200
- Unhealthy instances are removed from traffic

---

## 🔀 Types of Load Balancers

### 🟡 Classic Load Balancer (CLB)
- Legacy
- Supports HTTP, HTTPS, TCP
- Limited features

---

### 🟢 Application Load Balancer (ALB)
- Layer 7 (HTTP/HTTPS)
- Advanced routing:
  - Path-based (`/api`, `/users`)
  - Host-based (`api.example.com`)
- Supports WebSocket & HTTP/2

👉 Best for:
- Web apps
- Microservices

---

### 🔵 Network Load Balancer (NLB)
- Layer 4 (TCP/UDP)
- Ultra-fast, low latency
- Handles millions of requests

👉 Best for:
- High-performance systems
- Gaming, real-time apps

---

### 🟣 Gateway Load Balancer (GWLB)
- Layer 3 (network level)
- Used with:
  - Firewalls
  - Security appliances

---

## 🎯 Target Groups (ALB/NLB)

Load balancer routes traffic to:

- EC2 instances
- Containers (ECS)
- Lambda functions (ALB only)
- Private IPs

---

## 🍪 Sticky Sessions

Ensures a client always connects to the same instance.

- Uses cookies
- Useful for session-based apps

⚠️ Drawback:
- Can create uneven load

---

## 🔄 Cross-Zone Load Balancing

Distributes traffic across all AZs.

- ALB → enabled by default
- NLB → disabled by default (cost applies)

---

## 🔐 SSL / TLS Basics

- Encrypts traffic between client and load balancer
- Uses certificates (X.509)
- Managed via AWS Certificate Manager (ACM)

---

### SNI (Server Name Indication)

Allows multiple SSL certificates on one load balancer.

- Supported by ALB & NLB
- Not supported by CLB

---

## ⏳ Connection Draining

Allows existing requests to finish before terminating an instance.

- Prevents dropped requests
- Configurable timeout

---

# ⚙️ Auto Scaling Group (ASG)

Automatically adjusts number of EC2 instances.

---

## 🎯 ASG Goals

- Scale out when load increases
- Scale in when load decreases
- Maintain minimum/maximum capacity
- Replace unhealthy instances

---

## ⚙️ ASG Configuration

Includes:
- Launch Template (AMI, instance type)
- Security Groups
- Network settings
- IAM Role
- Min / Max / Desired capacity
- Load Balancer integration

---

## 📊 Scaling with CloudWatch

Scaling decisions are based on metrics:

- CPU usage
- Request count
- Network traffic
- Custom metrics

---

## 📈 Scaling Policies

### 🎯 Target Tracking
- Maintain a specific metric  
👉 Example: CPU = 50%

---

### 📉 Step Scaling
- Add/remove instances based on thresholds  
👉 Example: CPU > 70% → add 2 instances

---

### ⏰ Scheduled Scaling
- Scale based on time  
👉 Example: increase capacity during business hours

---

### 🔮 Predictive Scaling
- Forecast traffic and scale automatically

---

## ⏱️ Cooldown Period

- Default: 300 seconds
- Prevents rapid scaling changes
- Allows system to stabilize

---

## 🧠 Exam Tips

- High Availability → Multi-AZ + Load Balancer
- Scalability → Auto Scaling Group
- ALB → HTTP apps
- NLB → high performance TCP/UDP
- Health checks → remove unhealthy instances
- Sticky sessions → same user → same instance