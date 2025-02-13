resource "aws_subnet" "main" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = var.subnet_has_public_ip
  availability_zone       = var.Availability_zone
  tags = {
    Name = var.subnet_name
  }
} 