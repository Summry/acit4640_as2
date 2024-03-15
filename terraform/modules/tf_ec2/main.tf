resource "aws_instance" "ec2_instance" {
  /* 
    The number of EC2 instances to launch each with varying configurations.
  */

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

resource "aws_key_pair" "ssh_key_pair" {
  /* 
    The SSH key pair to be used for the EC2 instances.
    This resource block is repsonsible for importing the SSH public key to AWS.
  */

  key_name   = var.ssh_key_name
  public_key = file(var.ssh_pubkey_path)
}

locals {
  /* 
    The public DNS of the EC2 instances.
  */

  instance1_public_dns = aws_instance.ec2_instance[0].public_dns
  instance2_public_dns = aws_instance.ec2_instance[1].public_dns
}

resource "local_file" "inventory" {
  /* 
    Builds the inventory file for Ansible.
  */

  content = <<-EOF
  all:
    vars:
      ansible_user: ubuntu
      ansible_ssh_private_key_file: ${var.ssh_privkey_path}
    hosts:
      instance1:
        ansible_host: ${local.instance1_public_dns}
      instance2:
        ansible_host: ${local.instance2_public_dns}
  EOF

  filename = "${path.root}/../ansible/inventory.yaml"
}

resource "local_file" "ansible_config" {
  /* 
    Builds the Ansible configuration file.
  */

  content = <<-EOT
  [defaults]
  inventory = inventory.yaml
  stdout_callback = debug

  [ssh_connection]
  host_key_checking = False
  ssh_common_args = -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null
  EOT

  filename = "${path.root}/../ansible/ansible.cfg"
}
