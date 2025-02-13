variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "internet_gateway_name" {
  description = "Internet Gateway Name"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of Public Dubnet Ids"
  type        = list(any)
}