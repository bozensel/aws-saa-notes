provider "aws" {
  region = "eu-central-1"
}

resource "aws_sns_topic" "demo_topic" {
  name = "DemoTopic1"

  # Optional: enable encryption with AWS managed KMS key
  kms_master_key_id = "alias/aws/sns"
}