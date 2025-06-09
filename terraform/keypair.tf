resource "tls_private_key" "generated" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

#resource "aws_key_pair" "deployer" {
#  key_name   = "deployer-key"
#  public_key = tls_private_key.generated.public_key_openssh
#}

resource "local_file" "private_key" {
  filename        = "${path.module}/deployer.pem"    # <-- original pem file name here
  content         = tls_private_key.generated.private_key_pem
  file_permission = "0600"
}

resource "local_file" "public_key" {
  filename        = "${path.module}/deployer.pub"
  content         = tls_private_key.generated.public_key_openssh
  file_permission = "0644"
}
# Generate a private key (for ssh)
resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create an AWS EC2 instance
resource "aws_instance" "my_instance" {
  ami           = "ami-0c02fb55956c7d316"  # example AMI, update as needed
  instance_type = "t2.micro"

  key_name = aws_key_pair.deployer.key_name

  # other instance details ...
}

# Create AWS key pair from the private key
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = tls_private_key.example.public_key_openssh
}
