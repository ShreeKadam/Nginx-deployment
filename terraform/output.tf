output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}

output "private_instance_ip" {
  value = aws_instance.nginx_private.private_ip
}
