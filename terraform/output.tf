output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}

output "private_key_path" {
  value = local_file.private_key_pem.filename
}


output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnets" {
  value = aws_subnet.public[*].id
}

output "private_subnets" {
  value = aws_subnet.private[*].id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.nat.id
}

output "alb_dns_name" {
  value = aws_lb.nginx_alb.dns_name
}
