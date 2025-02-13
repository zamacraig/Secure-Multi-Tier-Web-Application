variable "Availability_zone" {
  description = "Availability Zone"
  type        = string
}

variable "ami_id" {
  description = "AMI image ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "internet_cidr" {
  description = "Internet CIDR"
  type        = string
  default     = "0.0.0.0/0"
}