resource "aws_security_group" "terrafrom_sg" {
  name        = "allow_ssh"
  description = "sg for to allow ssh"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = "Terraform_project_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.terrafrom_sg.id
  cidr_ipv4         = var.myip_cidr
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.terrafrom_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}