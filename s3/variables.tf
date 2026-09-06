variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Base name for the training data bucket (a random suffix is appended for global uniqueness)"
  type        = string
  default     = "model-training-data"
}
