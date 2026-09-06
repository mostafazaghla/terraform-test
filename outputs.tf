output "project_name" {
  description = "The project name"
  value       = var.project_name
}

output "config_file_path" {
  description = "Path to the generated config file"
  value       = local_file.config.filename
}

output "example_file_paths" {
  description = "Paths of all generated example files"
  value       = local_file.example[*].filename
}

output "name_prefix" {
  description = "Computed name prefix used across resources"
  value       = local.name_prefix
}
