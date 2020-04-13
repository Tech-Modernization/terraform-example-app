provider "aws" {
  version = "~> 2"
  region  = var.region
}

module "jenkins" {
  source       = "git@github.com:AaronNBrock/terraform-aws-jenkins.git?ref=v0.1.2"
  ssh_key_name = var.ssh_key_name
}

module "backend" {
  source       = "git@github.com:AaronNBrock/terraform-aws-s3-backend-resources.git?ref=v0.1.0"
  backend_name = var.backend_name
}

output "next_steps" {
  value = module.jenkins.next_steps
}

