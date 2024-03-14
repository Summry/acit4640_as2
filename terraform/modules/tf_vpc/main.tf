provider "aws" {
  region = var.aws_region
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
resource "aws_vpc" "vpc_1" {
  /*
    This VPC will be created in the us-west-2 region with a custom CIDR block.
    The DNS hostname will be enabled for the VPC.
  */

  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true
  tags = {
    Name    = "vpc_1"
    Project = var.project_name
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
resource "aws_subnet" "sn_1" {
  /* 
    This subnet will be created in the us-west-2 region with a custom CIDR block.
    The subnet will be associated with the VPC created in the previous step.
    Public IP addresses will be assigned to the instances launched in this subnet.
  */

  vpc_id                  = aws_vpc.vpc_1.id
  cidr_block              = var.subnet1_cidr
  availability_zone       = var.availability_zone_1
  map_public_ip_on_launch = true
  tags = {
    Name    = "sn_1"
    Project = var.project_name
  }
}

# Subnet for the second availability zone
resource "aws_subnet" "sn_2" {
  /* 
    Same as first, but different AZ and CIDR block.
  */

  vpc_id                  = aws_vpc.vpc_1.id
  cidr_block              = var.subnet2_cidr
  availability_zone       = var.availability_zone_2
  map_public_ip_on_launch = true
  tags = {
    Name    = "sn_2"
    Project = var.project_name
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway
resource "aws_internet_gateway" "gw_1" {
  /* 
    This internet gateway will be created in the us-west-2 region and associated with the VPC created in the previous step.
  */

  vpc_id = aws_vpc.vpc_1.id

  tags = {
    Name    = "gw_1"
    Project = var.project_name
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table
resource "aws_route_table" "rt_1" {
  /* 
    This route table will be created in the us-west-2 region and associated with the VPC created in the previous step.
    A default route will be added to the route table to allow internet access.
  */

  vpc_id = aws_vpc.vpc_1.id

  route {
    cidr_block = var.default_route
    gateway_id = aws_internet_gateway.gw_1.id
  }

  tags = {
    Name    = "rt_1"
    Project = var.project_name
  }
}

# Associate both subnets with the route table
resource "aws_route_table_association" "rt_assoc_1" {
  subnet_id      = aws_subnet.sn_1.id
  route_table_id = aws_route_table.rt_1.id
}

resource "aws_route_table_association" "rt_assoc_2" {
  subnet_id      = aws_subnet.sn_2.id
  route_table_id = aws_route_table.rt_1.id
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
resource "aws_security_group" "sg_1" {
  /* 
    This security group will be created in the us-west-2 region and associated with the VPC created in the previous step.
    Inbound rules will be added to allow HTTP and SSH access to the EC2 instances.
  */

  name        = "sg_1"
  description = "Allow http and ssh access to ec2."
  vpc_id      = aws_vpc.vpc_1.id
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule
resource "aws_vpc_security_group_egress_rule" "egress_rule" {
  /* 
    This egress rule will be added to the security group created in the previous step to allow all traffic to the specified CIDR block.
  */

  security_group_id = aws_security_group.sg_1.id
  ip_protocol       = -1
  cidr_ipv4         = var.sg_cidr
  tags = {
    Name    = "egress_rule"
    Project = var.project_name
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule
resource "aws_vpc_security_group_ingress_rule" "ssh_ingress_rule" {
  /* 
    This ingress rule will be added to the security group created in the previous step to allow SSH access from the specified CIDR block.
  */

  security_group_id = aws_security_group.sg_1.id
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_ipv4         = var.sg_cidr
  tags = {
    Name    = "ssh_ingress_rule"
    Project = var.project_name
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule
resource "aws_vpc_security_group_ingress_rule" "http_ingress_rule" {
  /* 
    This ingress rule will be added to the security group created in the previous step to allow HTTP access from the specified CIDR block.
  */
  
  security_group_id = aws_security_group.sg_1.id
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80
  cidr_ipv4         = var.sg_cidr
  tags = {
    Name    = "http_ingress_rule"
    Project = var.project_name
  }
}
