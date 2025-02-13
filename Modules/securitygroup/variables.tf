variable "security_group_name" {
  description = "Security Group Name"
  type        = string
}

variable "security_group_description" {
  description = "Security Group Description"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "ingress_port" {
  description = "Security Group Ingress Port"
  type        = string
}

variable "egress_port" {
  description = "Security Group Ingress Port"
  type        = string
  default     = "0"
}

variable "egress_cidr" {
  description = "internet CIDR"
  type        = string
}

variable "ingress_cidr" {
  description = "internet CIDR"
  type        = string
}

variable "ip_protocol" {
  description = "IP Protocol"
  type        = string
  default     = "TCP"
}