resource "aws_instance" "bastion" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  subnet_id       = var.public_subnet
  security_groups = [aws_security_group.bastion_sg.name]

  tags = {
    Name = "Bastion-Host"
  }
}

resource "aws_security_group" "bastion_security_group" {
  name        = "bastion-host-security-group"
  description = "allow incoming ssh connections"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ips
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bastion-host-security-group"
  }
}