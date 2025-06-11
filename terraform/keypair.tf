resource "tls_private_key" "deployer" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = tls_private_key.deployer.public_key_openssh
}

resource "local_file" "private_key_pem" {
  content              = tls_private_key.deployer.private_key_pem
  filename             = "${path.module}/deployer-key.pem"
  file_permission      = "0400" # ✅ Correctly used here
}
