                          Internet
                              |
                      Internet Gateway
                              |
                     ┌───────────────┐
                     │  Public Subnet │
                     │  10.0.1.0/24   │
                     │               │
                     │  Bastion Host │
                     │  NAT Gateway   │
                     └──────┬────────┘
                            |
                            | (private routing via NAT)
                            |
        ┌───────────────────┴───────────────────┐
        │                                       │
┌──────────────────────┐           ┌──────────────────────┐
│ Private Subnet       │           │ Private Subnet       │
│ 10.0.2.0/24          │           │ 10.0.2.0/24          │
│                      │           │                      │
│ EC2 #1               │           │ EC2 #2               │
│ (Internet via NAT)   │           │ (S3 via VPC Endpoint)│
└─────────┬────────────┘           └─────────┬────────────┘
          │                                   │
          │                                   │
          │                         VPC Gateway Endpoint
          │                                   │
          └─────────────── S3 Bucket ─────────┘

