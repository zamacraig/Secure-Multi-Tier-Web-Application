provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket       = "zamacraig-terraform-backend"
    key          = "Projects/Secure-Multi-Tier-Web-Application/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}