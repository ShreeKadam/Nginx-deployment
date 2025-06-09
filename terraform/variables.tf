variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "key_name" {
  default = "shared-key"
}

variable "ami" {
  default = "ami-0c02fb55956c7d316" # Amazon Linux 2
}
