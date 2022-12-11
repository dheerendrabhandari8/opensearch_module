resource "aws_subnet" "my_public_subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.pub_subnet_cidr
  availability_zone = var.subnet_az

  tags = {
    Name = "My Public Subnet"
  }
}
