variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro" # Free-tier eligible
}

variable "ami_id" {
  description = "Amazon Machine Image ID (OS image). Default is Amazon Linux 2 in us-east-1."
  type        = string
  default     = "ami-0c02fb55956c7d316"
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
  default     = "learn-terraform-vm"
}

variable "key_pair_name" {
  description = "Name of an existing EC2 key pair for SSH access (leave empty to skip)"
  type        = string
  default     = ""
}
