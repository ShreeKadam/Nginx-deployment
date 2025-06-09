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

output "private_key" {
  description = "Private key PEM for SSH access"
  value       = tls_private_key.example.private_key_pem
  sensitive   = true
}

output "key_name" {
  description = "Key pair name"
  value       = aws_key_pair.deployer.key_name
}

output "private_key_path" {
  value = local_file.private_key.filename
}

output "public_ip" {
  value = aws_instance.my_instance.public_ip
}
