resource "aws_instance" "ec2_instance_1" {
  count             = var.count
  ami               = var.ami_id
  instance_type     = "t2.micro"
  key_name          = var.ssh_key_name
  subnet_id         = element(var.subnet_ids, count.index)
  security_groups   = [var.security_group_id]
  availability_zone = element(var.availability_zones, count.index)
  tags = {
    Name    = "ec2_instance"
    Project = var.project_name
  }
}

# resource "aws_instance" "ec2_instance_2" {
#   ami             = var.ami_id
#   instance_type   = "t2.micro"
#   key_name        = var.ssh_key_name
#   subnet_id       = var.subnet2_id
#   count           = var.count
#   security_groups = [var.security_group_id]
#   tags = {
#     Name    = "ec2_instance_2"
#     Project = var.project_name
#   }
# }

