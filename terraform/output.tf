output "private_key_pem" {
  value     = tls_private_key.key.private_key_pem
  sensitive = true
}

output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}

output "private_instance_ip" {
  value = aws_instance.private_ec2.private_ip
}
