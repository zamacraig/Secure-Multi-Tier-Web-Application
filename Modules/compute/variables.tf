variable "ami_id" {
  description = "AMI image ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "instance_name" {
  description = "EC2 instance name"
  type        = string
}

variable "subnet_id" {
  description = "EC2 Subnet Id"
  type        = string
}

variable "security_group_name" {
  description = "EC2 Security Group Name"
  type        = string
}