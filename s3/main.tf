# S3 bucket names must be globally unique across all AWS accounts,
# so a random suffix is appended to the base name.
resource "random_id" "suffix" {
  byte_length = 4
}

module "training_data_bucket" {
  source = "../modules/s3-bucket"

  bucket_name        = "${var.bucket_name}-${random_id.suffix.hex}"
  versioning_enabled = true

  tags = {
    Name        = var.bucket_name
    Purpose     = "model-training-data"
    Environment = "learning"
    ManagedBy   = "terraform"
  }
}
