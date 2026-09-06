variable "bucket_name" {
  description = "Globally unique name for the S3 bucket"
  type        = string
}

variable "versioning_enabled" {
  description = "Keep prior versions of objects when they're overwritten or deleted"
  type        = bool
  default     = true
}

variable "force_destroy" {
  description = "Allow the bucket to be destroyed even if it still contains objects"
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to apply to the bucket"
  type        = map(string)
  default     = {}
}
