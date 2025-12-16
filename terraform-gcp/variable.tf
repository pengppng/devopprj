variable "project_id" {}
variable "region" { default = "asia-southeast1" }
variable "zone" { default = "asia-southeast1-a" }

variable "ssh_user" {
  default = "ubuntu"
}

variable "public_key_path" {
  default = "~/.ssh/id_rsa.pub"
}
