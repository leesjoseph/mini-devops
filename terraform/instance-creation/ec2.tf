resource "aws_key_pair" "deployer" {
  key_name   = var.public_key
  public_key = file(var.public_key_path)
}

resource "aws_instance" "terraform-instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = module.vpc.public_subnets[0]
  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.terrafrom_sg.id]
  tags = {
    Name = var.instance_name
  }
}

output "PublicIP" {
  value = aws_instance.terraform-instance.public_ip
}