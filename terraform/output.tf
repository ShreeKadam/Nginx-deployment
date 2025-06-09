# ----------------------
# Outputs
# ----------------------
output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}

output "nginx_private_ip" {
  value = aws_instance.nginx_private.private_ip
}
