provider "aws" {
  region = var.aws_region
}

module "bastion" {
  source          = "./modules/bastion-host"
  #aws_region      = var.aws_region
  ami_id          = var.ami_id
  instance_type   = var.instance_type
  public_subnet= var.public_subnet
  key_name    = var.key_name
  vpc_id          = var.vpc_id
  allowed_ips    = var.allowed_ips
}

output "bastion_public_ip" {
  value = module.bastion.bastion_public_ip
}