/*
  Variables for the EC2 module
*/

variable "project_name" {
  description = "Project name"
}

variable "aws_region" {
  description = "AWS region"
}

variable "ami_id" {
  description = "AMI ID"
}

variable "subnet_ids" {
  description = "List of subnet IDs"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "name_tag" {
  description = "Name of instance"
  default     = "ec2_instance"
}

variable "availability_zones" {
  description = "List of availability zones"
  default     = ["us-west-2a", "us-west-2b"]
}

variable "security_group_id" {
  description = "The security group to launch the instance in"
}

variable "ssh_key_name" {
  description = "AWS SSH key name"
}

variable "ssh_pubkey_path" {
  // Local path to the SSH public key
  
  description = "Path to the SSH public key"
  default     = "~/.ssh/4640_key.pub"
}

variable "ssh_privkey_path" {
  // Local path to the SSH private key
  
  description = "Path to the SSH private key"
  default     = "~/.ssh/4640_key"
}

variable "ec2_count" {
  description = "Number of instances to create"
  default     = 2
}

provider "aws" {
  region = var.aws_region
}
