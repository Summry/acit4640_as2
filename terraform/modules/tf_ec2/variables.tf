variable "project_name" {
  description = "Project name"

}

variable "aws_region" {
  description = "AWS region"
  default     = "us-west-2"
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
  default = [ "us-west-2a" , "us-west-2b" ]
}

variable "security_group_id" {
  description = "The security group to launch the instance in"
}

variable "ssh_key_name" {
  description = "AWS SSH key name"
}

variable "ec2_count" {
  description = "Number of instances to create"
  default     = 2
}

provider "aws" {
  region = var.aws_region
}
