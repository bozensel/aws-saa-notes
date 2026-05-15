# Amazon VPC and Networking in AWS

## Introduction to CIDR and IPv4 Addressing

### What is CIDR?

CIDR (Classless Inter-Domain Routing) is a method used to define ranges of IP addresses in networking. AWS uses CIDR blocks extensively when configuring VPCs, subnets, security groups, and route tables.

A CIDR block contains:

* A base IP address
* A subnet mask

Example:

```text
192.168.0.0/26
```

This represents the IP range:

```text
192.168.0.0 → 192.168.0.63
```

Total IP addresses: 64

---

## CIDR Components

### Base IP

The starting IP address in the range.

Examples:

```text
10.0.0.0
172.16.0.0
192.168.1.0
```

### Subnet Mask

Defines how many bits are fixed.

Common subnet masks:

| CIDR | Subnet Mask     |
| ---- | --------------- |
| /8   | 255.0.0.0       |
| /16  | 255.255.0.0     |
| /24  | 255.255.255.0   |
| /32  | 255.255.255.255 |

---

## CIDR Examples

| CIDR             | IP Range                      | Total IPs |
| ---------------- | ----------------------------- | --------- |
| 192.168.0.0/24   | 192.168.0.0 – 192.168.0.255   | 256       |
| 192.168.0.0/16   | 192.168.0.0 – 192.168.255.255 | 65,536    |
| 134.56.78.123/32 | Single IP only                | 1         |
| 0.0.0.0/0        | All IPv4 addresses            | Unlimited |

---

# Public vs Private IPv4 Addresses

Private IP ranges are reserved for internal networks and cannot be routed over the public internet.

## Private IP Ranges

| CIDR Range     | Typical Usage             |
| -------------- | ------------------------- |
| 10.0.0.0/8     | Large enterprise networks |
| 172.16.0.0/12  | AWS default VPC range     |
| 192.168.0.0/16 | Home and office networks  |

All other IPv4 addresses are considered public.

---

# Default VPC in AWS

Every AWS account includes a default VPC in each region.

Features:

* Internet connectivity enabled by default
* EC2 instances automatically receive public IPv4 addresses
* Public and private DNS hostnames are assigned

If no subnet is specified, EC2 launches into the default VPC.

---

# Amazon VPC Overview

A VPC (Virtual Private Cloud) is an isolated network environment in AWS.

## Key Characteristics

* Multiple VPCs per AWS Region
* Default limit: 5 VPCs per region
* Supports private IPv4 ranges only
* CIDR size:

  * Minimum: /28
  * Maximum: /16

Important:
Avoid overlapping CIDR ranges with corporate or on-premises networks.

---

# Subnets in AWS

Subnets divide a VPC into smaller network segments.

Each subnet belongs to a single Availability Zone.

---

## Reserved IP Addresses in AWS Subnets

AWS reserves 5 IP addresses in every subnet.

Example:

```text
10.0.0.0/24
```

Reserved addresses:

| IP Address | Purpose           |
| ---------- | ----------------- |
| 10.0.0.0   | Network address   |
| 10.0.0.1   | AWS router        |
| 10.0.0.2   | AWS DNS           |
| 10.0.0.3   | Reserved          |
| 10.0.0.255 | Broadcast address |

---

# Internet Gateway (IGW)

An Internet Gateway allows communication between a VPC and the internet.

## Key Features

* Highly available and scalable
* Attached at VPC level
* One IGW per VPC
* Requires route table configuration

---

## Internet Access Architecture

```text
Internet
    |
    v
+-------------------+
| Internet Gateway  |
+-------------------+
          |
          v
+-------------------+
| Public Subnet     |
| EC2 Instances     |
+-------------------+
```

---

# Bastion Hosts

A Bastion Host is a secure EC2 instance placed in a public subnet and used to SSH into private instances.

## Security Recommendations

* Allow SSH only from trusted IP ranges
* Private instances should only allow inbound SSH from the bastion host

---

## Bastion Architecture

```text
Internet
   |
SSH
   |
+----------------+
| Bastion Host   |
| Public Subnet  |
+----------------+
        |
SSH
        |
+----------------+
| Private EC2    |
| Private Subnet |
+----------------+
```

---

# NAT Instance

A NAT Instance enables outbound internet access for private EC2 instances.

## Requirements

* Must be in public subnet
* Requires Elastic IP
* Source/Destination check disabled
* Route tables configured properly

## Limitations

* Not highly available by default
* Requires manual scaling and maintenance
* Performance depends on EC2 instance type

---

# NAT Gateway

AWS-managed alternative to NAT Instances.

## Benefits

* Fully managed
* High availability within an AZ
* Automatically scales
* Up to 100 Gbps bandwidth
* No Security Group management required

---

## NAT Gateway Architecture

```text
Private EC2
      |
      v
+----------------+
| NAT Gateway    |
| Public Subnet  |
+----------------+
      |
      v
Internet Gateway
      |
Internet
```

---

# Network ACLs (NACL)

NACLs operate at subnet level and control inbound/outbound traffic.

## Characteristics

* Stateless
* Supports ALLOW and DENY rules
* Rules evaluated in order
* First matching rule wins

---

# Security Groups vs NACLs

| Security Group      | NACL                     |
| ------------------- | ------------------------ |
| Instance level      | Subnet level             |
| Stateful            | Stateless                |
| Allow rules only    | Allow and deny rules     |
| Evaluates all rules | First matching rule wins |

---

# VPC Peering

VPC Peering privately connects two VPCs.

## Key Points

* Non-overlapping CIDRs required
* Not transitive
* Route tables must be updated

---

## VPC Peering Diagram

```text
+-------------+        Peering        +-------------+
|   VPC A     | <------------------> |   VPC B     |
+-------------+                      +-------------+
```

---

# VPC Endpoints (AWS PrivateLink)

VPC Endpoints provide private connectivity to AWS services without internet access.

## Benefits

* No NAT Gateway required
* No Internet Gateway required
* Secure private connectivity

---

## Types of Endpoints

### Interface Endpoint

* Uses ENI
* Requires Security Groups
* Supports most AWS services

### Gateway Endpoint

* Supports S3 and DynamoDB only
* Free to use
* Configured in route tables

---

# Lambda Accessing DynamoDB from VPC

## Best Practice

Use a Gateway Endpoint for DynamoDB instead of routing through NAT Gateway.

---

## Recommended Architecture

```text
Lambda in VPC
      |
      v
DynamoDB Gateway Endpoint
      |
      v
Amazon DynamoDB
```

---

# VPC Flow Logs

VPC Flow Logs capture IP traffic information.

## Supported Levels

* VPC
* Subnet
* ENI

## Destinations

* CloudWatch Logs
* Amazon S3
* Kinesis Data Firehose

---

# Troubleshooting with Flow Logs

| Traffic Pattern                  | Likely Cause           |
| -------------------------------- | ---------------------- |
| Inbound REJECT                   | NACL or Security Group |
| Inbound ACCEPT + Outbound REJECT | NACL                   |
| Outbound REJECT                  | NACL or Security Group |

---

# AWS Site-to-Site VPN

Connects on-premises infrastructure to AWS securely over the internet.

## Components

### Virtual Private Gateway (VGW)

AWS-side VPN endpoint.

### Customer Gateway (CGW)

On-premises VPN device.

---

## VPN Architecture

```text
On-Premises Network
        |
   VPN Tunnel
        |
+-------------------+
| Virtual Private   |
| Gateway (VGW)     |
+-------------------+
        |
        v
       VPC
```

---

# AWS VPN CloudHub

Allows multiple branch offices to communicate securely through AWS.

## Use Case

Hub-and-spoke VPN topology using a shared VGW.

---

# AWS Direct Connect (DX)

Provides a dedicated private connection between on-premises and AWS.

## Benefits

* Lower latency
* More consistent throughput
* Reduced internet dependency
* Supports hybrid cloud

---

## Direct Connect Architecture

```text
On-Premises Data Center
          |
   Direct Connect Link
          |
AWS Direct Connect Location
          |
          v
         VPC
```

---

# Transit Gateway

Transit Gateway acts as a central hub for connecting:

* Multiple VPCs
* VPNs
* Direct Connect

## Advantages

* Simplifies network architecture
* Supports transitive routing
* Cross-account connectivity

---

## Transit Gateway Hub-and-Spoke Model

```text
           +-------------+
           | Transit GW  |
           +-------------+
            /    |    \
           /     |     \
        VPC1   VPC2   VPN
```

---

# Traffic Mirroring

Traffic Mirroring captures and forwards network traffic for inspection.

## Common Use Cases

* Security monitoring
* Packet analysis
* Troubleshooting
* Threat detection

---

# IPv6 Overview

IPv6 solves IPv4 exhaustion.

## Characteristics

* Massive address space
* Publicly routable
* Hexadecimal format

Example:

```text
2001:db8::1234:5678
```

---

# IPv6 in AWS VPC

AWS supports dual-stack networking:

* IPv4 + IPv6 together
* EC2 instances can receive both addresses

Important:
IPv4 cannot be disabled in AWS VPCs.

---

# Egress-Only Internet Gateway

Used for IPv6 outbound internet access only.

## Similar To

Acts like a NAT Gateway for IPv6.

Prevents inbound internet connections.

---

# AWS Networking Cost Optimization

## Best Practices

* Use private IP communication whenever possible
* Keep resources in the same Availability Zone
* Minimize internet egress traffic
* Use CloudFront with S3 to reduce transfer costs

---

# AWS Network Firewall

AWS-managed firewall service for VPC protection.

## Protection Layers

* Layer 3 to Layer 7
* Inbound/outbound filtering
* Intrusion prevention

---

## Features

* Domain filtering
* Protocol filtering
* Regex matching
* Threat prevention
* Centralized rule management

---

# AWS Network Firewall Architecture

```text
Internet
    |
    v
+----------------------+
| AWS Network Firewall |
+----------------------+
          |
          v
         VPC
```

---

# Final Summary

## Core Networking Components

| Service          | Purpose                             |
| ---------------- | ----------------------------------- |
| VPC              | Isolated virtual network            |
| Subnet           | Segment of VPC                      |
| IGW              | Internet connectivity               |
| NAT Gateway      | Internet access for private subnets |
| Security Group   | Instance-level firewall             |
| NACL             | Subnet-level firewall               |
| VPC Peering      | Connect two VPCs                    |
| Transit Gateway  | Central networking hub              |
| VPN              | Secure internet-based connection    |
| Direct Connect   | Dedicated private AWS connection    |
| Flow Logs        | Network traffic monitoring          |
| VPC Endpoints    | Private AWS service access          |
| Network Firewall | Advanced VPC protection             |




