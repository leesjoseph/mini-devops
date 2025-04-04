# Generic Variables
region      = "ap-northeast-2"
environment = "prod"
owners      = "aws"


# VPC Variables
name                               = "vpc-terraform" # Overridning the name defined in variable file
cidr                               = "10.0.0.0/16"
azs                                = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
public_subnets                     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
private_subnets                    = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
database_subnets                   = ["10.0.151.0/24", "10.0.152.0/24", "10.0.153.0/24"]
create_database_subnet_group       = true
create_database_subnet_route_table = true
enable_nat_gateway                 = true
single_nat_gateway                 = true
myip_cidr                          = "79.110.55.0/24"
ami                                = "ami-0c1989c90aa86e7cf"
instance_name                      = "terraform-instance"
instance_type                      = "t2.medium"