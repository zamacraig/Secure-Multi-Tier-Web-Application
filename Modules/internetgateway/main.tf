resource "aws_internet_gateway" "main" {
  vpc_id = var.vpc_id
  tags = {
    Name = var.internet_gateway_name
  }
}

resource "aws_route_table" "public" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
}

locals {
  public_subnet_map = { for idx, val in var.public_subnet_ids : idx => val }
}

resource "aws_route_table_association" "main" {
  for_each = local.public_subnet_map
  route_table_id = aws_route_table.public.id
  subnet_id      = each.value
}
