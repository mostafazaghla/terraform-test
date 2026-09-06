# Locals are computed values derived from variables or other data.
# They help avoid repetition and keep configs DRY.
locals {
  name_prefix = "${var.project_name}-${var.environment}"

  common_tags = merge(var.tags, {
    project     = var.project_name
    environment = var.environment
  })

  output_dir = "${path.module}/generated"
}
