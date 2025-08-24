resource "aws_security_group" "s_g" {
name = "{var.project_name}"
description = "allow shh and http traffic"
vpc_id = "var.vpc_id"


ingress {
from_port = 22
to_port = 22
cidr_blocks = "var.my_ip"
protocol = "tcp"
}
ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = "0.0.0.0/0"
}
ingress {
    from_port = 443
    to_port = 443
    protocol = tcp
    cidr_blocks = "0.0.0.0/0"
}
egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = "0.0.0.0/0"
}
}

resource "aws_instance" "terra" {
  ami_id = var.ami_id
  instance_type = var.instance_type
  security_groups = aws_security_group.s_g
  key_name = var.key_name


  tags = {
    name = {first_terraform_module}
  }
}