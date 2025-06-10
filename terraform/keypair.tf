# Generate an RSA private key (2048 bits)
resource "tls_private_key" "deployer" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Create an AWS key pair with the generated public key
resource "aws_key_pair" "deployer" {
  key_name   = var.key_name           # pass this from variables.tf or default
  public_key = tls_private_key.deployer.public_key_openssh
  file_permission = "0400"
}

# Save private key to local file for SSH access
resource "local_file" "private_key_pem" {
  filename        = "${path.module}/../keys/${var.key_name}.pem"  # adjust path as needed
  content         = tls_private_key.deployer.private_key_pem
  file_permission = "0400"
}
