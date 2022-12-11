resource "aws_instance" "my_instance" {
#count = 2
ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.pub_subnet_id
  associate_public_ip_address = true
  tags = {
    "Name" : "openseach"
  }
}

