provider "aws" {
  region = "eu-central-1"
}

############################
# SNS TOPIC
############################
resource "aws_sns_topic" "demo_topic" {
  name = "DemoTopic1"

  # Encryption (AWS managed)
  kms_master_key_id = "alias/aws/sns"
}

############################
# SQS QUEUES
############################
resource "aws_sqs_queue" "queue1" {
  name = "DemoQueue1"
  sqs_managed_sse_enabled = true
}

resource "aws_sqs_queue" "queue2" {
  name = "DemoQueue2"
  sqs_managed_sse_enabled = true
}

############################
# SQS POLICIES (ALLOW SNS)
############################
resource "aws_sqs_queue_policy" "queue1_policy" {
  queue_url = aws_sqs_queue.queue1.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = "sqs:SendMessage"
        Resource = aws_sqs_queue.queue1.arn
        Condition = {
          ArnEquals = {
            "aws:SourceArn" = aws_sns_topic.demo_topic.arn
          }
        }
      }
    ]
  })
}

resource "aws_sqs_queue_policy" "queue2_policy" {
  queue_url = aws_sqs_queue.queue2.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = "sqs:SendMessage"
        Resource = aws_sqs_queue.queue2.arn
        Condition = {
          ArnEquals = {
            "aws:SourceArn" = aws_sns_topic.demo_topic.arn
          }
        }
      }
    ]
  })
}

############################
# SNS → SQS SUBSCRIPTIONS
############################
resource "aws_sns_topic_subscription" "sub_queue1" {
  topic_arn = aws_sns_topic.demo_topic.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.queue1.arn
}

resource "aws_sns_topic_subscription" "sub_queue2" {
  topic_arn = aws_sns_topic.demo_topic.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.queue2.arn
}

############################
# OUTPUTS
############################
output "sns_topic_arn" {
  value = aws_sns_topic.demo_topic.arn
}

output "queue1_url" {
  value = aws_sqs_queue.queue1.url
}

output "queue2_url" {
  value = aws_sqs_queue.queue2.url
}
