output "instance_ip" {
  value = aws_instance.main.id
}

output "instance_ip_addr" {
  value = aws_instance.main.private_ip
}

output "instance_arn" {
  value = aws_instance.main.arn
}