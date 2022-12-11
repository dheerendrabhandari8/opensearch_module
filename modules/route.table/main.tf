resource "aws_route_table" "my_public_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = {
    Name = "My Public Route Table"
  }
}

resource "aws_route_table_association" "public_1_rt_a" {
  subnet_id      = var.pub_subnet_id	
  route_table_id = aws_route_table.my_public_rt.id
}

