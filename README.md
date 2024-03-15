# ACIT 4640 Assignment 2 - Ansible and Terraform

# Introduction

This assignment is to demonstrate the use of Ansible and Terraform to provision and automate infrastructure.

# Video

[ACIT 4640 Assignment 2 - Ansible and Terraform](https://youtu.be/ReSaUvU2HyY)

# Team Members

- [x] Nazira Fakhrurradi (A01279940)

# Installation

## Repository

1. Clone the repository to your local machine.

```bash
git clone https://github.com/Summry/nazira_fakhrurradi_as2.git
```

## SSH Key

Before we begin, an SSH key pair is required to access the servers.

1. Generate a local SSH key pair using the following command.

```bash
ssh-keygen -t ed25519 -C <email>
```

2. Name the key pair `4640_key` and place it in the `~/.ssh` directory. If you choose a different name or location, update the `terraform/variables.tf` or the `terraform.tfvars` file accordingly.

> Look at the terraform variables for the ssh key and ssh key path.

## Terraform

1. Download and install Terraform according to your operating system from the [official website](https://www.terraform.io/downloads.html).
2. Verify the installation by running `terraform --version`

## Ansible

1. Install Ansible using the package manager of your choice or by following the instructions over at [DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-ansible-on-ubuntu-20-04).
2. Verify the installation by running `ansible --version`

# Usage

## Terraform

1. Navigate to the `terraform` directory.
2. Run `terraform init` to initialize the working directory.
3. Run `terraform plan` to see the changes that will be made.
4. Run `terraform apply` to create the infrastructure.
5. Run `terraform destroy` to delete the infrastructure.

## Ansible

> After creating the infrastructure using Terraform, the Ansible playbook can be run to configure the servers.

1. Navigate to the `ansible` directory.
2. Run the following command to run the playbook.

```bash
ansible-playbook setup.yaml
```

# Conclusion

This assignment has demonstrated the use of Ansible and Terraform to provision and automate infrastructure.

# References

- [Terraform](https://developer.hashicorp.com/terraform/docs)
- [Ansible](https://docs.ansible.com/)

# [Go to Top](#acit-4640-assignment-2---ansible-and-terraform)