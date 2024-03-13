resource "aws_instance" "ec2_instance" {
  count             = var.ec2_count
  ami               = var.ami_id
  instance_type     = var.instance_type
  key_name          = var.ssh_key_name
  subnet_id         = var.subnet_ids[count.index]
  security_groups   = [var.security_group_id]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name    = var.name_tag
    Project = var.project_name
  }
}

locals {
  instance1_public_dns = aws_instance.ec2_instance[0].public_dns
  instance2_public_dns = aws_instance.ec2_instance[1].public_dns
}

resource "local_file" "inventory" {

  content = <<-EOF
  all:
    vars:
      ansible_user: ubuntu
      ansible_ssh_private_key_file: ${var.ssh_key_path} # ~/.ssh/4640_key
    hosts:
      instance1:
        ansible_host: ${local.instance1_public_dns}
      instance2:
        ansible_host: ${local.instance2_public_dns}
  EOF

  filename = "/home/nazira/BCIT/ACIT4640/acit4640_as2/ansible/inventory.yaml"
}

resource "local_file" "ansible_config" {

  content = <<-EOT
  [defaults]
  inventory = inventory.yaml
  stdout_callback = debug

  [ssh_connection]
  host_key_checking = False
  ssh_common_args = -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null
  EOT

  filename = "/home/nazira/BCIT/ACIT4640/acit4640_as2/ansible/ansible.cfg"
}
