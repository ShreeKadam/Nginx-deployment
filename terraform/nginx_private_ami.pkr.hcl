packer {
  required_plugins {
    amazon = {
      version = ">= 1.11.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "ami_name" {
  type    = string
  default = "nginx-private-ami"
}

source "amazon-ebs" "nginx_private" {
  region                      = var.aws_region
  instance_type               = "t2.micro"
  ssh_username                = "ubuntu"
  associate_public_ip_address = true

  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
      virtualization-type = "hvm"
      root-device-type    = "ebs"
    }
    most_recent = true
    owners      = ["099720109477"]
  }

  # ✅ Cleaned AMI name to remove invalid characters
  ami_name = "${var.ami_name}-${timestamp() | clean_resource_name}"

  tags = {
    Name          = "nginx-private"
    Project       = "nginx"
    NGINX_Private = "yes"
  }
}

build {
  sources = ["source.amazon-ebs.nginx_private"]

  provisioner "shell" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install nginx -y",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx"
    ]
  }

  post-processor "manifest" {
    output = "manifest.json"
  }

  post-processor "shell-local" {
    inline = [
      "echo '{{ .ArtifactId }}' | awk -F ':' '{print $2}' | tee ami_id.txt"
    ]
  }
}
