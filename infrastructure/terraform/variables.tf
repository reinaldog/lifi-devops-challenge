variable "aws_region" {
  type    = string
  default = "eu-north-1"
}

variable "aws_access_key" {
  sensitive = true
}
variable "aws_secret_key" {
  sensitive = true
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "custom_cidr" {
  description = "Custom CIDR for the Security Group inbound rule"
  type        = string
}

variable "key_name" {
  type = string
  default = "tf-key"
}
