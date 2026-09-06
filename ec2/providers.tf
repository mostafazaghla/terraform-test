terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Credentials are picked up automatically from:
#   1. Environment variables: AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY
#   2. ~/.aws/credentials file (via `aws configure`)
#   3. IAM role attached to the machine (on EC2/ECS)
provider "aws" {
  region = var.aws_region
}
