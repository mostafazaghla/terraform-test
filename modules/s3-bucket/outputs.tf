output "bucket_id" {
  description = "The bucket name"
  value       = aws_s3_bucket.this.id
}

output "bucket_arn" {
  description = "The bucket's ARN"
  value       = aws_s3_bucket.this.arn
}

output "bucket_regional_domain_name" {
  description = "The bucket's region-specific domain name"
  value       = aws_s3_bucket.this.bucket_regional_domain_name
}
