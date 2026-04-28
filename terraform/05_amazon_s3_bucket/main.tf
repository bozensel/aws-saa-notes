provider "aws" {
  region = "eu-central-1"
}

########################
# S3 Bucket
########################
resource "aws_s3_bucket" "website_bucket" {
  bucket = "s3-bucket-created-terraform"

  tags = {
    Name = "terraform-s3-website"
  }
}

########################
# Disable Block Public Access
########################
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.website_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

########################
# Bucket Policy (Public Read)
########################
resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.website_bucket.id

  depends_on = [aws_s3_bucket_public_access_block.public_access]

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.website_bucket.arn}/*"
      }
    ]
  })
}

########################
# Enable Website Hosting
########################
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.website_bucket.id

  index_document {
    suffix = "index.html"
  }
}

########################
# Upload index.html
########################
resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.website_bucket.id
  key    = "index.html"
  source = "index.html"
  content_type = "text/html"

  etag = filemd5("index.html")
}

########################
# Output Website URL
########################
output "website_url" {
  value = "http://${aws_s3_bucket.website_bucket.bucket}.s3-website.eu-central-1.amazonaws.com"
}