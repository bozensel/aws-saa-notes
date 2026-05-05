provider "aws" {
  region = "eu-central-1"
}

resource "aws_sqs_queue" "demo_queue" {
  name = "DemoQueue1"

  # Standard queue (default)
  fifo_queue = false

  # Encryption (SSE-SQS using AWS managed key)
  sqs_managed_sse_enabled = true

  # Message settings (matching your example)
  message_retention_seconds = 345600   # 4 days
  visibility_timeout_seconds = 30
  max_message_size = 1024 * 1024       # 1024 KB (1 MB)
  delay_seconds = 0
  receive_wait_time_seconds = 0
}