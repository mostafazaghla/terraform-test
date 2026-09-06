variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "my-terraform-project"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}

variable "file_count" {
  description = "Number of example files to create"
  type        = number
  default     = 3
}

variable "tags" {
  description = "A map of tags to apply"
  type        = map(string)
  default = {
    team    = "learning"
    managed = "terraform"
  }
}
