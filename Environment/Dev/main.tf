// EC2 Instances
module "web" {
  source = "../../Modules/compute"

  ami_id              = var.ami_id
  instance_name       = "Web"
  instance_type       = var.instance_type
  security_group_name = module.security_group_web.security_group_name
  subnet_id           = module.subnet_web.id
}

module "app" {
  source = "../../Modules/compute"

  ami_id              = var.ami_id
  instance_name       = "App"
  instance_type       = var.instance_type
  security_group_name = module.security_group_app.security_group_name
  subnet_id           = module.subnet_app.id
}

module "db" {
  source = "../../Modules/compute"

  ami_id              = var.ami_id
  instance_name       = "Database"
  instance_type       = var.instance_type
  security_group_name = module.security_group_db.security_group_name
  subnet_id           = module.subnet_db.subnet_id
}

// Network 
module "network" {
  source = "../../Modules/network"

  vpc_cidr = "10.0.0.0/16"
  vpc_name = "Secure Multi-Tier App VPC"
}

// Subnets
module "subnet_web" {
  source = "../../Modules/subnet"

  vpc_id               = module.network.vpc_id
  Availability_zone    = var.Availability_zone
  subnet_has_public_ip = true
  subnet_cidr          = "10.0.1.0/24"
  subnet_name          = "Web Subnet"
}

module "subnet_app" {
  source = "../../Modules/subnet"

  vpc_id            = module.network.vpc_id
  Availability_zone = var.Availability_zone
  subnet_cidr       = "10.0.2.0/24"
  subnet_name       = "App Subnet"
}

module "subnet_db" {
  source = "../../Modules/subnet"

  vpc_id            = module.network.vpc_id
  Availability_zone = var.Availability_zone
  subnet_cidr       = "10.0.3.0/24"
  subnet_name       = "Database Subnet"
}

// Internet Gateway
module "internet_gateway" {
  source = "../../Modules/internetgateway"

  vpc_id                = module.network.vpc_id
  internet_gateway_name = "VPC Internet Gateway"
  public_subnet_ids     = [module.subnet_web.subnet_id]
}

// Security Groups
module "security_group_web" {
  source = "../../Modules/securitygroup"

  security_group_name        = "web_security_group"
  security_group_description = "Web Security Group allows traffic to and from internet and internal network"
  vpc_id                     = module.network.vpc_id
  ingress_cidr               = var.internet_cidr
  egress_cidr                = var.internet_cidr
  ingress_port               = "80"
  egress_port                = "80"
}

module "security_group_app" {
  source = "../../Modules/securitygroup"

  security_group_name        = "app_security_group"
  security_group_description = "App Security Group only allows traffic from Web Subnet"
  vpc_id                     = module.network.vpc_id
  ingress_cidr               = module.subnet_web.subnet_cidr
  egress_cidr                = module.subnet_web.subnet_cidr
  ingress_port               = "8080"
  egress_port                = "8080"
}

module "security_group_db" {
  source = "../../Modules/securitygroup"

  security_group_name        = "web_security_group"
  security_group_description = "Web Security Group only allows traffic from App Subnet"
  vpc_id                     = module.network.vpc_id
  ingress_cidr               = module.subnet_app.subnet_cidr
  egress_cidr                = module.subnet_app.subnet_cidr
  ingress_port               = "3306"
  egress_port                = "3306"
}
