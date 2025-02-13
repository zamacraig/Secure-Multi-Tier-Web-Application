variable "Availability_zone" {
  description = "Availability Zone"
  type        = string
}

variable "vpc_id" {
  description = "VPC Id"
  type        = string
}

variable "subnet_cidr" {
  description = "Subnet CIDR"
  type        = string
}

variable "subnet_name" {
  description = "Subnet Name"
  type        = string
}

variable "subnet_has_public_ip" {
  description = "Subnet Name"
  type        = bool
  default     = false
}