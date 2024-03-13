output "ec2_instance1_id" {
  value = aws_instance.ec2_instance[0].id
}

output "ec2_instance2_id" {
  value = aws_instance.ec2_instance[1].id
}

output "ec2_instance1_public_ip" {
  value = aws_instance.ec2_instance[0].public_ip
}

output "ec2_instance2_public_ip" {
  value = aws_instance.ec2_instance[1].public_ip
}

output "ec2_instance1_public_dns" {
  value = aws_instance.ec2_instance[0].public_dns
}

output "ec2_instance2_public_dns" {
  value = aws_instance.ec2_instance[1].public_dns
}
