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
  type        = list(object({
    id = string
  }))
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default = [ "us-west-2a" , "us-west-2b" ]
}

variable "security_group_id" {
  description = "The security group to launch the instance in"
}

variable "ssh_key_name" {
  description = "AWS SSH key name"
  default     = "acit4640as2"
}

variable "count" {
  description = "Number of instances to create"
  default     = 2
}

provider "aws" {
  region = var.aws_region
}
