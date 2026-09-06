output "instance_id" {
  description = "The EC2 instance ID"
  value       = aws_instance.vm.id
}

output "public_ip" {
  description = "Public IP address to SSH into"
  value       = aws_instance.vm.public_ip
}

output "public_dns" {
  description = "Public DNS hostname"
  value       = aws_instance.vm.public_dns
}

output "ssh_command" {
  description = "Command to SSH into the instance (requires key pair)"
  value       = "ssh -i ~/.ssh/${var.key_pair_name}.pem ec2-user@${aws_instance.vm.public_ip}"
}

output "security_group_id" {
  description = "ID of the security group attached to the instance"
  value       = aws_security_group.vm_sg.id
}
