output "bastion_public_ip" {
  description = "Public IP of bastion host"
  value       = aws_instance.bastion.public_ip
}

output "private_instance_private_ip" {
  description = "Private IP of private NGINX instance"
  value       = aws_instance.private_nginx.private_ip
}
