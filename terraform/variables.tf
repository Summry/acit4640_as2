variable "aws_region" {
  description = "AWS region"
  default     = "us-west-2"
}

variable "project_name" {
  description = "Project name - as2"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  default     = "10.0.0.0/16"
}

variable "subnet1_cidr" {
  description = "Subnet CIDR"
  default     = "10.0.1.0/24"
}

variable "subnet2_cidr" {
  description = "Subnet 2 CIDR"
  default     = "10.0.2.0/24"
}

variable "default_route"{
  description = "Default route"
  default     = "0.0.0.0/0"
}

variable "ami_id" {
  description = "AMI ID"
}

variable "ssh_key_name"{
  description = "AWS SSH key name"
  default = "ACIT4640_key"
}
