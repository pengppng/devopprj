variable "aws_region" {
  default = "ap-southeast-1"
}

variable "ami_id" {
  description = "Ubuntu 22.04 AMI"
}

variable "key_name" {
  description = "EC2 key pair name"
}
