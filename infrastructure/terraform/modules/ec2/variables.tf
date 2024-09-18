variable "vpc_security_group_ids" {
  description = "List of security group IDs to associate with the EC2 instance"
  type        = list(string)
}

variable "subnet_id" {
  description = "The ID of the subnet to launch the EC2 instance in"
  type        = string
}

variable "ami" {
  type = string
  default = "ami-04cdc91e49cb06165"
}

variable "key_name" {
  type = string
  default = "tf-key"
}

variable "public_key_path" {
  type = string
  default = "~/.ssh/tf-key.pub"
}
