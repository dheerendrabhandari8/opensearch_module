module vpc {
  source = "./modules/vpc"
  vpc_cidr  = var.vpc_cidr
vpc_name = var.vpc_name
}

module subnet {
  source = "./modules/subnet"
#count = 2
  pub_subnet_cidr = var.pub_subnet_cidr
  vpc_id = module.vpc.vpc_id
  subnet_az = var.subnet_az
}

module igw {
  source = "./modules/igw"
  vpc_id = module.vpc.vpc_id
}

module route_table {
  source = "./modules/route.table"
  vpc_id = module.vpc.vpc_id
  pub_subnet_id = module.subnet.pub_subnet_id
  igw_id = module.igw.igw_id
}

module security_group {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
sg_name = var.sg_name 
}

module "ec2_instance" {
  source = "./modules/instance"
  pub_subnet_id = module.subnet.pub_subnet_id
  security_group_id = module.security_group.security_group_id
  ami           = var.ami      
  instance_type 	        	= var.instance_type      
  key_name      = var.key_name
}

