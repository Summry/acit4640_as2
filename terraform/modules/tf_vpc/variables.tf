/*
  This file contains the variables that are used in the VPC module
*/

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

variable "availability_zone_1" {
  description = "Availability Zone"
  default     = "us-west-2a"
}

variable "availability_zone_2" {
  description = "Availability Zone"
  default     = "us-west-2b"
}

variable "default_route" {
  description = "Default route"
  default     = "0.0.0.0/0"
}

variable "sg_cidr" {
  description = "Egress and Ingress CIDR for security group"
  default     = "0.0.0.0/0"
}
