# Specifies the required providers and their versions.
# The AWS provider version 4.16 or later and the Local provider version 2.1 or later are required.

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.1"
    }
  }
  required_version = ">= 1.3.0"
}

# Configure the AWS provider
provider "aws" {
  region = "us-west-2"
}