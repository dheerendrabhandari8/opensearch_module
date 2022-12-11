variable "ami" {}
variable "instance_type" {}
variable "key_name" {}
variable "pub_subnet_id" {}
#variable "security_group_id" {}
variable "security_group_id" {
    type = string
    description = "(optional) describe your variable"
}

