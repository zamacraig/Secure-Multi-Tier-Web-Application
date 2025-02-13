resource "aws_security_group" "main" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = var.vpc_id

  tags = {
    Name = var.security_group_name
  }
}

resource "aws_vpc_security_group_ingress_rule" "main" {
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = var.ingress_cidr
  from_port         = var.ingress_port
  to_port           = var.ingress_port
  ip_protocol       = var.ip_protocol
}

resource "aws_vpc_security_group_egress_rule" "main" {
  security_group_id = aws_security_group.main.id
  cidr_ipv6         = var.egress_cidr
  from_port         = var.egress_port
  to_port           = var.egress_port
  ip_protocol       = var.ip_protocol
}