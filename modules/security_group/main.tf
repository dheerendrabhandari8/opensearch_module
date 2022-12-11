resource "aws_security_group" "my_sg" {
  name   = "sg_opensearch"
  vpc_id = var.vpc_id
  tags = {
    Name    = var.sg_name   
  }
  # ingress {
  #   from_port   = 80
  #   to_port     = 80
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }
    # ssh access from everywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    # inter-cluster communication over ports 9200-9400
ingress {
    from_port   = 9200
    to_port     = 9400
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    # allow kibana (opensearch-dashborad) port 5601
 ingress {
    from_port = 5601
    to_port   = 5601
    protocol  = "tcp"
 }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

