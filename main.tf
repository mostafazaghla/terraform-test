# Creates a directory to hold generated files
resource "local_file" "config" {
  filename = "${local.output_dir}/config.json"
  content = jsonencode({
    project     = var.project_name
    environment = var.environment
    tags        = local.common_tags
  })
}

# Creates multiple files using count (a core Terraform meta-argument)
resource "local_file" "example" {
  count    = var.file_count
  filename = "${local.output_dir}/file-${count.index + 1}.txt"
  content  = "File ${count.index + 1} for ${local.name_prefix}\n"
}

# null_resource runs arbitrary local commands via provisioners
resource "null_resource" "echo" {
  triggers = {
    # Re-runs whenever config.json changes
    config_hash = local_file.config.content
  }

  provisioner "local-exec" {
    command = "echo 'Config written: ${local_file.config.filename}'"
  }
}
