provider "aws" {
  region = "eu-central-1"
}

########################
# EB Application
########################
resource "aws_elastic_beanstalk_application" "app" {
  name        = "MyApplication2"
  description = "Simple EB app"
}

########################
# IAM Role
########################
resource "aws_iam_role" "eb_ec2_role" {
  name = "eb-ec2-role-v2"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "web" {
  role       = aws_iam_role.eb_ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier"
}

resource "aws_iam_role_policy_attachment" "worker" {
  role       = aws_iam_role.eb_ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWorkerTier"
}

resource "aws_iam_instance_profile" "eb_profile" {
  name = "eb-instance-profile-v2"
  role = aws_iam_role.eb_ec2_role.name
}

########################
# EB Environment
########################
resource "aws_elastic_beanstalk_environment" "env" {
  name        = "my-env"
  application = aws_elastic_beanstalk_application.app.name

  solution_stack_name = "64bit Amazon Linux 2023 v6.10.1 running Node.js 20"

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t3.micro"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = aws_iam_instance_profile.eb_profile.name
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = "SingleInstance"
  }
}

