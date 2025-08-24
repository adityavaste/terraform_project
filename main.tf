provider "aws" {
    region = "ap-south-1"
  
}

module "e-server" {
  source = "./module/e-server"
ami_id = var.ami_id
project_name = var.project_name
security_group = var.security_group
vpc_id = var.vpc_id
instance_type = var.instance_type
subnet_id = var.subnet_id
key_name = var.key_name
my_ip = var.my_ip
}