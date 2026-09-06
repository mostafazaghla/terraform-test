output "bucket_id" {
  description = "The training data bucket name"
  value       = module.training_data_bucket.bucket_id
}

output "bucket_arn" {
  description = "The training data bucket's ARN"
  value       = module.training_data_bucket.bucket_arn
}

output "bucket_regional_domain_name" {
  description = "The training data bucket's region-specific domain name"
  value       = module.training_data_bucket.bucket_regional_domain_name
}
