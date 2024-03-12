module "vpc" {
  source       = "./modules/tf_vpc"
  project_name = var.project_name
}

module "ec2" {
  source            = "./modules/tf_ec2"
  project_name      = var.project_name
  ami_id            = var.ami_id
  security_group_id = module.vpc.sg_1_id
  subnet_ids        = [module.vpc.sn_1_id, module.vpc.sn_2_id]
}
