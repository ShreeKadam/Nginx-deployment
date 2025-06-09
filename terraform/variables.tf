variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "key_name" {
  description = "Name of the AWS key pair"
  type        = string
  default     = "deployer-key"
}

variable "ami" {
  description = "AMI ID for instances"
  type        = string
  default     = "ami-0c02fb55956c7d316"  # update as needed
}
