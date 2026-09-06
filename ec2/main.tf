# --- Networking ---

# Look up the default VPC that AWS creates in every account
data "aws_vpc" "default" {
  default = true
}

# Look up all subnets inside that VPC
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# --- Security Group ---

# A security group is a virtual firewall for the instance
resource "aws_security_group" "vm_sg" {
  name        = "${var.instance_name}-sg"
  description = "Allow SSH and outbound internet"
  vpc_id      = data.aws_vpc.default.id

  # Allow inbound SSH (port 22) from anywhere
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Restrict to your IP in production!
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.instance_name}-sg"
  }
}

# --- EC2 Instance ---

resource "aws_instance" "vm" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = data.aws_subnets.default.ids[0]
  vpc_security_group_ids = [aws_security_group.vm_sg.id]

  # Attach a key pair only if one was provided
  key_name = var.key_pair_name != "" ? var.key_pair_name : null

  # User data runs as root on first boot (like a startup script)
  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    echo "Hello from Terraform!" > /home/ec2-user/hello.txt
  EOF

  # Ensures instance gets a public IP so you can SSH into it
  associate_public_ip_address = true

  tags = {
    Name        = var.instance_name
    Environment = "learning"
    ManagedBy   = "terraform"
  }
}
