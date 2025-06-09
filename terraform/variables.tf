variable "region" {
  default = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "key_name" {
  description = "EC2 Key Pair name"
  type        = string
}

variable "bastion_instance_type" {
  default = "t2.micro"
}

variable "private_instance_type" {
  default = "t2.micro"
}
