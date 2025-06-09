#provider "aws" {
#  region = var.region
#}

#resource "tls_private_key" "this" {
#  algorithm = "RSA"
#  rsa_bits  = 2048
#}

#resource "aws_key_pair" "deployer" {
#  key_name   = var.key_name
#  public_key = tls_private_key.this.public_key_openssh
#}

#resource "local_file" "pem_key" {
#  filename = "${path.module}/../keys/${var.key_name}.pem"
#  content  = tls_private_key.this.private_key_pem
#  file_permission = "0600"
#}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = { Name = "tool-eval-vpc" }
}

# Subnets, IGW, RT, NAT, etc...

resource "aws_instance" "bastion" {
  ami                         = var.ami
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public[0].id
  key_name                    = aws_key_pair.deployer.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.bastion_sg.id]

  tags = {
    Name = "bastion-host"
  }
}

resource "aws_instance" "nginx_private" {
  ami                         = var.ami
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.private[0].id
  key_name                    = aws_key_pair.deployer.key_name
  associate_public_ip_address = false
  vpc_security_group_ids      = [aws_security_group.private_ec2_sg.id]

  tags = {
    Name = "nginx-private"
    Role = "nginx"
  }
}


