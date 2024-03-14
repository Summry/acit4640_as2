/*
This file is used to output the values of the resources created in the main.tf file.
*/

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "sn_1" {
  value = module.vpc.sn_1_id
}

output "sn_2" {
  value = module.vpc.sn_2_id 
}

output "gw_1" {
  value = module.vpc.gw_1_id
}

output "rt_1" {
  value = module.vpc.rt_1_id
}

output "sg_1" {
  value = module.vpc.sg_1_id
}

output "ec2_instance1_id" {
  value = module.ec2.ec2_instance1_id
}

output "ec2_instance2_id" {
  value = module.ec2.ec2_instance2_id
}

output "ec2_instance1_public_ip" {
  value = module.ec2.ec2_instance1_public_ip
}

output "ec2_instance2_public_ip" {
  value = module.ec2.ec2_instance2_public_ip
}

output "ec2_instance1_public_dns" {
  value = module.ec2.ec2_instance1_public_dns
}

output "ec2_instance2_public_dns" {
  value = module.ec2.ec2_instance2_public_dns
}
