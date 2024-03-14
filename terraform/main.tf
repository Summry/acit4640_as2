# Module block for the vpc
module "vpc" {
  source       = "./modules/tf_vpc"
  project_name = var.project_name
  aws_region   = var.aws_region
}

# Module block for the EC2 instances
module "ec2" {
  source            = "./modules/tf_ec2"
  aws_region        = var.aws_region
  project_name      = var.project_name
  ami_id            = var.ami_id
  ssh_key_name      = var.ssh_key_name
  security_group_id = module.vpc.sg_1_id
  subnet_ids        = [module.vpc.sn_1_id, module.vpc.sn_2_id]
}
