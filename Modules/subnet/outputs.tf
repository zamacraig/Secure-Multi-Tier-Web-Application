output "subnet_id" {
  value = aws_subnet.main.id
}

output "subnet_cidr" {
  value = aws_subnet.main.cidr_block
}

output "subnet_arn" {
  value = aws_subnet.main.arn
}