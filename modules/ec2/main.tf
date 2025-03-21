resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  key_name      = var.key_name
  vpc_security_group_ids = var.vpc_security_group_ids
  
  user_data = var.user_data

  tags = {
    Name = var.instance_name
  }
}
