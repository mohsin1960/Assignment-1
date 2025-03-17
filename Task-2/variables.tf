variable "aws_region" {
  type        = string
}

variable "ami_id" {
  type        = string
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  type        = string
}

variable "vpc_id" {
  type        = string
}

variable "public_subnet" {
  type        = string
}

variable "allowed_ips" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

