provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-014f11e8c26ed3e15"  # ← buraya AWS console’da gördüğün AMI ID
  instance_type = "t3.micro"

  tags = {
    Name = "simple-ec2"
  }
}