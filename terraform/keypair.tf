resource "tls_private_key" "generated" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = tls_private_key.generated.public_key_openssh
}

resource "local_file" "private_key" {
  filename        = "${path.module}/private_key.pem"
  content         = tls_private_key.generated.private_key_pem
  file_permission = "0600"
}

resource "local_file" "public_key" {
  filename        = "${path.module}/public_key.pem"
  content         = tls_private_key.generated.public_key_openssh
  file_permission = "0644"
}
